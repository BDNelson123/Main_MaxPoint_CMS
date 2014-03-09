require 'nokogiri'
require 'time'

namespace :import do
  desc "Import posts from previous system"
  task :posts, [:import_file] => :environment do |t, args|
    if args[:import_file].blank?
      puts "Usage: rake import:posts[path/to/import_file.xml]"
      exit
    end
    doc = Nokogiri::XML(open(args[:import_file]))

    def import_posts(doc, authors)
      emails_by_login = authors.inject({}) {|h, a| h[a[:login]] = a[:email]; h}
      ids_by_login = authors.inject({}) {|h, a| h[a[:login]] = a[:id]; h}

      @entries = doc.xpath('//item').map do |i|
        entry = {
          :title => i.xpath('title').inner_text,
          :status => i.xpath('wp:status').inner_text,
          :slug => i.xpath('wp:post_name').inner_text,
          :author_login => i.xpath('dc:creator').inner_text,
          :author_email => emails_by_login[i.xpath('dc:creator').inner_text],
          :author_id => ids_by_login[i.xpath('dc:creator').inner_text],
          :published_at => (Time.parse(i.xpath('pubDate').inner_text) rescue nil),
          :description => i.xpath('content:encoded').inner_text.to_s.split('<!--more-->').first,
          :content => i.xpath('content:encoded').inner_text,
          :categories => i.xpath("category[@domain='category']").map(&:inner_text),
          :tags => i.xpath("category[@domain='post_tag']").map(&:inner_text),
        }
        i.xpath('wp:postmeta').each do |j|
          case j.xpath('wp:meta_key').inner_text
          when '_aioseop_title'
            entry[:meta_title] = j.xpath('wp:meta_value').inner_text
          when '_aioseop_keywords'
            entry[:meta_keywords] = j.xpath('wp:meta_value').inner_text
          when '_aioseop_description'
            entry[:meta_description] = j.xpath('wp:meta_value').inner_text
          end
        end
        entry
      end
    end

    def import_authors(doc)
      authors = doc.xpath('//wp:author').map do |i|
        author = {
          :login => i.xpath('wp:author_login').inner_text,
          :email => i.xpath('wp:author_email').inner_text,
          :full_name => i.xpath('wp:author_display_name').inner_text,
          :first_name => i.xpath('wp:author_first_name').inner_text,
          :last_name => i.xpath('wp:author_last_name').inner_text,
        }
        author
      end
    end

    authors = import_authors(doc)
    authors.each do |author|
      a = Cms::User.find_or_create_by_email(author[:email], name: author[:full_name], password: 'password1', password_confirmation: 'password1')
      author[:id] = a.id
    end

    posts = import_posts(doc, authors)

    posts.map{|p| p[:tags]}.flatten.uniq.each do |tag|
      t = Cms::Tag.find_or_create_by_name(tag, locality_id: Cms::Locality.first.id)
    end

    posts.map{|p| p[:categories]}.flatten.uniq.each do |category|
      t = Cms::Category.find_or_create_by_name(category, locality_id: Cms::Locality.first.id)
    end

    posts.each do |post|
      published_at = post[:published_at] > 10.years.ago ? post[:published_at] : Time.now
      body = post[:content].gsub("\n", "<br/>\n").gsub("</li><br/>", '</li>').gsub("</ul><br/>", '</ul>').gsub("</p><br/>", '</p>')
      p = Cms::Post.find_or_create_by_slug(post[:slug], {
        locality: Cms::Locality.first,
        author_id: post[:author_id],
        title: post[:title],
        description: post[:description],
        body: body,
        published: post[:status] == 'publish',
        published_at: published_at,
        created_at: published_at,
        category: Cms::Category.find_all_by_name(post[:categories]).last,
        tags: Cms::Tag.find_all_by_name(post[:tags]),
        meta_keywords: post[:meta_keywords]
      })
    end
  end
end

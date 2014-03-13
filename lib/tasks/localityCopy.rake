# Logic
# Has to copy over all pages
# -- Each page has three dependencies
# ---- pages (parent_id)
# ---- links
# ---- components

namespace :localityCopy do
  desc "Copy US pages to UK pages"

  task :copy_pages => :environment do
    # change this to determine what locality you will transfer to
    @@fromSlug = 'us'
    @@toSlug = 'uk'

    # array of the ids for the pages copied
    @@pagesCopied = []

    # gets slug ID
    @@fromLocalityID = Cms::Locality.find_by_slug(@@fromSlug).id
    @@toLocalityID = Cms::Locality.find_by_slug(@@toSlug).id

    public

    # creates log record of copy
    def copyLog(page,clone_page,category)
      copy = Cms::Copy.new
      copy.category = category
      copy.locality_from = @@fromLocalityID
      copy.locality_to = @@toLocalityID
      copy.id_from = page.id
      copy.id_to = clone_page.id
      copy.save

      # add to array
      @@pagesCopied << clone_page.id
    end

    # insert new parent_id into pages
    def parentID(category)
      object = Cms::Page.where(:id => @@pagesCopied)

      object.each do |t|
        if t.parent_id
          getID = Cms::Copy.select("id_to").where(:id_from => t.parent_id, :category => category).first

          parent = Cms::Page.find_by_id(t.id)
          parent.parent_id = getID.id_to
          parent.save
        end
      end
    end

    # clones a page
    def usPagesNoParent(page)
      clone_page = page.dup
      clone_page.locality_id = @@toLocalityID
      clone_page.save

      self.copyLog(page,clone_page,'page')
    end

    # copy pages
    def copyPages
      fromPages = Cms::Page.where(:locality_id => @@fromLocalityID)
        
      fromPages.each do |toPages|
        if toPages.copy.exclude? @@toLocalityID  # makes sure record can't be copied to same locality twice
          self.usPagesNoParent(toPages)
          toPages.copy += [@@toLocalityID]  # makes record that page has been copied
          toPages.save
        end
      end
    end

    self.copyPages
    self.parentID('page')
    # self.copyLinks
    # self.copyComponents
  end
end

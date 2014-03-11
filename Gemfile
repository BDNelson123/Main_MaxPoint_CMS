source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'vasari-cms', require: 'cms', :git => 'https://github.com/BDNelson123/Gem_MaxPoint_CMS.git'
gem 'ckeditor'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'strong_parameters'
gem 'pg'

group :assets do
  gem 'sass', '3.2.13'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
end

group :production do
  # This is a Heroku hack gem
  gem 'rails_12factor'
  gem 'pg'
end

group :test do
end

ruby '2.0.0'

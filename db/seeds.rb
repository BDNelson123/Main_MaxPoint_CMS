# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = Cms::User.create!(name: "Michael Redmond", email: 'michael@crashshop.com', password: 'password', admin: true)

us = Cms::Locality.create! name: "United States", slug: 'us'
config = Cms::Configuration.create! name: "MaxPoint", default_locality_id: us.id
#Cms::Link.create(name: 'home')
#Cms::Link.create(name: 'contact')

# This migration comes from cms (originally 20130412181327)
class CreateCmsPages < ActiveRecord::Migration
  def change
    create_table :cms_pages do |t|
      t.integer :locality_id
      t.integer :parent_id
      t.string :slug
      t.string :title

      t.timestamps
    end
  end
end

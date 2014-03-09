# This migration comes from cms (originally 20130513223931)
class CreateCmsComments < ActiveRecord::Migration
  def change
    create_table :cms_comments do |t|
      t.integer :post_id
      t.string :email
      t.string :name
      t.text :body
      t.integer :parent_id

      t.timestamps
    end
  end
end

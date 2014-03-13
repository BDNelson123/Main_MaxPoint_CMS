# This migration comes from cms (originally 20140312213245)
class AddCopyToCmsPages < ActiveRecord::Migration
  def self.up
    add_column :cms_pages, :copy, :integer, array: true, null:false, default: '{}'
  end

  def self.down
    remove_column :cms_pages, :copy
  end
end

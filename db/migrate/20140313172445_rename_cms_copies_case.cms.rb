# This migration comes from cms (originally 20140313172135)
class RenameCmsCopiesCase < ActiveRecord::Migration
  def self.up
    rename_column :cms_copies, :case, :category
  end

  def self.down
    rename_column :cms_copies, :category, :type
  end
end

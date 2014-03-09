# This migration comes from cms (originally 20130516195851)
class CommentsUpdate < ActiveRecord::Migration
  def up
    add_column :cms_comments, :approved_by_id, :integer
  end

  def down
    remove_column :cms_comments, :approved_by_id
  end
end

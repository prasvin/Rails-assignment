class RenameLikeToGeneralContent < ActiveRecord::Migration
  def self.up
    rename_column :blogs, :like, :general_content
  end

  def self.down
    rename_column :blogs, :general_content, :like
  end
end

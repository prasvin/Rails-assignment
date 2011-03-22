class AddEmailToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :email, :string
  end

  def self.down
    remove_column :blogs, :email
  end
end

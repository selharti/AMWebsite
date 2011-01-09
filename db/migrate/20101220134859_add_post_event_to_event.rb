class AddPostEventToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :postevent, :text
  end

  def self.down
    remove_column :events, :postevent
  end
end

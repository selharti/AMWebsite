class AddPublicPostEventToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :publicpostevent, :text
  end

  def self.down
    remove_column :events, :publicpostevent
  end
end

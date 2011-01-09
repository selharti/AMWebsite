class AddMaxAudienceToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :maxaudience, :smallint, :default => 0;
  end

  def self.down
    remove_column :events, :maxaudience
  end
end

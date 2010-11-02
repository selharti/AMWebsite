class CreateEventUser < ActiveRecord::Migration
  def self.up 
    create_table :events_users, :id => false do |t|  
      t.belongs_to :event
      t.belongs_to :user
    end
  end
  
  def self.down
    drop_table :events_users
  end
end

class EventsMembers < ActiveRecord::Migration
  def self.up 
    create_table :events_members, :id => false do |t|  
      t.belongs_to :event
      t.belongs_to :member
    end
  end
  
  def self.down
    drop_table :events_members
  end
end

class AddIsAdminUser < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :title, :string
    add_column :users, :organization, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string, :default => "Maroc"
    add_column :users, :note, :text
    add_column :users, :is_admin, :boolean, :default => false
  end

  def self.down
    remove_column :users, :firstname
    remove_column :users, :lastname
    remove_column :users, :title    
    remove_column :users, :organization
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :country
    remove_column :users, :note
    remove_column :users, :is_admin
  end
end

class AddIsAdminUser < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string, :default => false
    add_column :users, :lastname, :string, :default => false
    add_column :users, :company_name, :string, :default => false
    add_column :users, :function, :string, :default => false
    add_column :users, :is_admin, :boolean, :default => false
  end

  def self.down
    remove_column :users, :firstname
    remove_column :users, :lastname
    remove_column :users, :company_name
    remove_column :users, :function
    remove_column :users, :is_admin
  end
end

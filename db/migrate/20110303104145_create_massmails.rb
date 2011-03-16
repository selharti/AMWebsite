class CreateMassmails < ActiveRecord::Migration
  def self.up
    create_table :massmails do |t|
      t.string :from
      t.string :to
      t.string :cc
      t.string :bcc
      t.string :sentbyuser
      t.string :subject
      t.text :body
      t.datetime :datetimecreated
      t.datetime :datetimesent      
      t.timestamps
    end
  end

  def self.down
    drop_table :massmails
  end
end

class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.references :user
      t.references :category
      t.references :location
      t.string :room
      t.string :name
      t.text :description
      t.integer :quantity
      t.text :pickup_details
      t.string :status
      t.datetime :expiration

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end

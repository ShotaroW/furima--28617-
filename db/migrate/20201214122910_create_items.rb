class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :item_description
      t.references :user,foreign_key: true
      t.integer :category_id
      t.integer :status_id
      t.integer :fee_id
      t.integer :area_id
      t.integer :days_to_ship_id
      t.timestamps
    end
  end
end

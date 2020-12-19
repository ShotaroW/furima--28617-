class CreateDaysToShipIds < ActiveRecord::Migration[6.0]
  def change
    create_table :days_to_ship_ids do |t|

      t.timestamps
    end
  end
end

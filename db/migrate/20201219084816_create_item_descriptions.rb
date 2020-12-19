class CreateItemDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :item_descriptions do |t|

      t.timestamps
    end
  end
end

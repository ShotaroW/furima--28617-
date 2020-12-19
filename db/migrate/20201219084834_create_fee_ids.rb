class CreateFeeIds < ActiveRecord::Migration[6.0]
  def change
    create_table :fee_ids do |t|

      t.timestamps
    end
  end
end

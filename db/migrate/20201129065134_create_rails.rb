class CreateRails < ActiveRecord::Migration[6.0]
  def change
    create_table :rails do |t|
      t.string :route

      t.timestamps
    end
  end
end

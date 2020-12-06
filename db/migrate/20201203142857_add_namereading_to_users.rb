class AddNamereadingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_reading, :string
    add_column :users, :last_name_reading, :string
  end
end

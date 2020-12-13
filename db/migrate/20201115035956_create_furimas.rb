class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string  :nickname,              null: false
      t.string  :email,                 null: false, default: ""
      t.string  :password,             null: false
      t.string  :password_confirmation,             null: false
      t.string  :first_name,           null: false
      t.string  :first_name_reading,      null: false
      t.string  :last_name,            null: false
      t.string  :last_name_resding,       null: false
      t.date    :birth_date,             null: false
    end
  end
end

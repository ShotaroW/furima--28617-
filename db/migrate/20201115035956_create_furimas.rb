class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string  :nickname,              null: false
      t.string  :email,                 null: false, default: ""
      t.string  :encrypted_password,    null: false, default: ""
      t.string  :family_name,           null: false
      t.string  :family_name_kana,      null: false
      t.string  :first_name,            null: false
      t.string  :first_name_kana,       null: false
      t.date    :birth_day,             null: false
    end
  end
end

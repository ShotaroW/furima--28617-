class Furima < ApplicationRecord
  def change
    create_table :items do |t|
      t.string  :content
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
end

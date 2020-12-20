class Item < ApplicationRecord
  
  has_one_attached :category_id, :text, presence: true

  validates :content, presence: true

  belongs_to :user
  belongs_to :price
  belongs_to :item_description
  belongs_to_active_hash :area_id
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship_id
  belongs_to_active_hash :fee_id
  belongs_to_active_hash :status_id


  validates :price, null:false,numericality: { only_integer: true,greater_than: 300, less_than: 9999999},format: { with:/\d/}
  validates :item_description, null:false
  validates :area_id, numericality: { other_than: 1 }
  validates :category, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :fee_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :price, numericality: { other_than: 1 }

end

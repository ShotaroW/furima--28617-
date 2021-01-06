class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :fee
  belongs_to_active_hash :status
  has_one_attached :image



  validates_numericality_of :price,{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
  with_options numericality: { other_than:1} do
  validates :area_id
  validates :category_id
  validates :days_to_ship_id
  validates :fee_id
  validates :status_id
  end

  with_options presence: true do
  validates :name, presence:true
  validates :item_description, presence:true
  validates :image, presence: true
  end
end

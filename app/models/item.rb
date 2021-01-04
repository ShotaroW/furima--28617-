class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  # belongs_to :price
  # belongs_to :item_description
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :fee
  belongs_to_active_hash :status
  has_one_attached :image



  validates_numericality_of :price,{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :item_description, presence:true
  validates :area_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :fee_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :name, presence:true
  


  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end

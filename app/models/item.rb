class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :price
  belongs_to :item_description
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :fee
  belongs_to_active_hash :status
  has_many_attached :image



  validates :price, null:false,numericality: { only_integer: true,greater_than: 300, less_than: 9999999},format: { with:/\d/}
  validates :item_description, null:false
  validates :area, numericality: { other_than: 1 }
  validates :category, numericality: { other_than: 1 }
  validates :days_to_ship, numericality: { other_than: 1 }
  validates :fee, numericality: { other_than: 1 }
  validates :status, numericality: { other_than: 1 }
  validates :price, numericality: { other_than: 1 }


  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end

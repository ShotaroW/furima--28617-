class Form
include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :house_number, :phone_number,:item_id, :user_id, :token


  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than:1}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token, presence: true
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code,area_id: area_id ,city: city, address: address, house_number: house_number, phone_number: phone_number)
  end
end
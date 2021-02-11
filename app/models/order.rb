class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase_history
  # has_many :orders
  # has_many :items

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :adress
    validates :house_number
    validates :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  def save
    user =  User.create(nickname: nickname, email: email, password: password, first_name: first_name, family_name: family_name, first_name_reading: first_name_reading, last_name_reading: last_name_reading, birth_day: birth_day)
    Item.create(name: name, price: price, item_description: item_description, category_id: category_id, status_id: status_id, fee_id: fee_id, area_id: area_id, days_to_ship_id: days_to_ship_id, user_id: user.id)
  end
end
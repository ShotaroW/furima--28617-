FactoryBot.define do
  factory :item do
    name {"商品サンプル"}
    price {5000}
    item_description {"商品詳細"}
    category_id {"2"}
    status_id {"2"}
    fee_id {"2"}
    area_id {"2"}
    days_to_ship_id {"2"}

    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
  end
end
end

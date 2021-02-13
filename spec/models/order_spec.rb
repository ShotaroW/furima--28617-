require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品購入' do
context "商品が購入できる場合" do
  it 'post_code、area_id、city、adress、house_number、phone_numberが必須であること'do
  expect(@order).to be_valid
end
  it'郵便番号にはハイフンが必要であること（123-4567となる）'do
  @order.post_code= "123-4567"
  @order.valid?
  expect(@order).to be_valid       
end

context "商品が購入できない場合" do
  it "post_codeが空では登録できない" do
    @order.post_code = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code can't be blank")
  end
  it'post_codeにハイフンがない場合登録できない'do
  @order.post_code = 1234567
  @order.valid?
  expect(@order.errors.full_messages).to include("Post code input correcrtly")
 end
 it "status_idのidが1の場合に保存できない" do
  @order.status_id = 1
  @order.valid?
  expect(@order.errors.full_messages).to include("Status must be other than 1")
end
it "cityが空では登録できない" do
  @order.city = nil
  @order.valid?
  expect(@order.errors.full_messages).to include("City can't be blank")
end
it "addressが空では登録できない" do
  @order.adress = nil
  @order.valid?
  expect(@order.errors.full_messages).to include("Address can't be blank")
end
 it "phone_numberが空では登録できない" do
  @order.phone_number = nil
  @order.valid?
  expect(@order.errors.full_messages).to include("Phone number can't be blank")
end
it "house_numberが空では登録できない" do
  @order.house_number = nil
  @order.valid?
  expect(@order.errors.full_messages).to include("House number can't be blank")
end
it'phone_numberにハイフンがあると登録できない'do
@order.phone_number= 080-1234-5678
@order.valid?
expect(@order.errors.full_messages).to include("Phone number is invalid")
end
it'phone_numberが11桁以上だと登録できない'do
@order.phone_number= "090123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
end

  end


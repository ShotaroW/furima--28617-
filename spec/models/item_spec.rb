require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context "商品情報が保存できる場合" do
      it "商品名と商品の価格、商品の説明、商品画像、カテゴリーの情報、商品の状態、配送料の負担、発送元の地域、発送までの日数があれば商品情報は保存される" do
        expect(@user).to be_valid
      end
      it "商品の価格が¥300~¥9,999,999の場合に保存される"
      @item.price [3-9][0-9]{2}|[1-9][0-9]{3,6}
      expect(@user).to be_valid
    end
    context "商品情報が保存できない場合" do
      it "商品名がないとは保存できない" do
      end     
      it "商品の価格がないと保存できない" do
      end
      it "商品の価格が¥300~¥9,999,999以外の場合に保存できない" do
      end
      it "商品の説明がない場合に保存できない" do
      end
      it "商品画像がない場合に保存できない" do
      end
      it "カテゴリーの情報がない場合に保存できない" do
      end
      it "商品状態の情報がない場合に保存できない" do
      end
      it "配送料の負担がない場合に保存できない" do
      end
      it "発送元の情報がない場合に保存できない" do
      end
      it "発送までの日数がない場合に保存できない" do
      end
    end
  end



end

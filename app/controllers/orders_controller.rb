class OrdersController < ApplicationController

  def index
    @order = Form.new
    @item = Item.find(params[:item_id])
  end
  def create
    @order = Form.new(order_params)
    if @order.valid?
      Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:form).permit(
      :post_code,
      :area_id,
      :city,
      :address,
      :house_number,
      :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
    end
end

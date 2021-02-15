class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :set_order, only: [:index, :create]

  def index
    @order = Form.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.order != nil 
      redirect_to root_path
    end
  end
  def create
    @order = Form.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  def set_order   
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
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

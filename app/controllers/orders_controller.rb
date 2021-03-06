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
  
  private

  def set_order   
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

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

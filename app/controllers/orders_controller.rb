class OrdersController < ApplicationController

  def index
    @order = Form.new
    @item = Item.find(params[:item_id])
  end
  def create
    @order = Form.new(order_params)
    if @order.save
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
      :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
    end
end

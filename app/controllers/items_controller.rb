class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @items = Item.all.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def show
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
    def item_params
     params.require(:item).permit(
      :image,
       :name,
       :price,
       :item_description,
       :category_id,
       :status_id,
       :fee_id,
       :area_id,
       :days_to_ship_id ).merge(user_id: current_user.id)
    end


end

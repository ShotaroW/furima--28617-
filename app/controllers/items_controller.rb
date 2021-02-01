class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def edit
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
   if  current_user.id == @item.user_id
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
   end
  end

  def set_item                         
    @item = Item.find(params[:id])
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

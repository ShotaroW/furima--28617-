class OrderController < ApplicationController

  def index
    @item = Item.new(item_params)
  end
end

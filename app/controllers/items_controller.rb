class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :message, :image, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :contributor_confirmation, only: [:edit]

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

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :message, :image, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end
end

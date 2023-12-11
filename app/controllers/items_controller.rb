class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :contributor_confirmation, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user_for_edit, only: [:edit]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
    redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  
  private
  def item_params
    params.require(:item).permit(:item_name, :price, :message, :image, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def authenticate_user_for_edit
    unless user_signed_in? && @item.order.blank?
      redirect_to root_path
    end
  end
end

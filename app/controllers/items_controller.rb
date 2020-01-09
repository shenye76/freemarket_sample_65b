class ItemsController < ApplicationController

  layout 'devise', only: [:new, :buy_confirmation]

  def index
    @items = Item.joins(:photos).group("item_id").order('id DESC')
  end

  def new
    @item = Item.new
    @item.photos.new
    @item.brands.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render new_user_path
    end
  end

  def exhibiting
    @item = Item.find(params[:id])
    @buyedphotos = @item.buyed_items
  end

  def trading
    @user = User.find(params[:id])
    @sellingitem = @user.selling_items
  end

  def sold
    @user = User.find(params[:id])
    @solditem = @user.sold_items
  end

  def get_delivery_method
  end 

  def edit
  end

  def update
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def buy_confirmation
  end

  def exhibiting
  end

  def sold
  end

  def trading
  end

end

private

def item_params
  params.require(:item).permit(:name, :description, :price, :text, :brand, :condition, :delivery_fee, :prefecture_id, :shipping_days, :shipping_area, :price, :categoryname, :user_id, photos_attributes: [:image], brands_attributes: [:brandname])

end

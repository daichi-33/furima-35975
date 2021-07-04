class ItemsController < ApplicationController
  def index
    @item = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

   private
   def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

end

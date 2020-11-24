class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
  end
end
  





  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :image, :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

end

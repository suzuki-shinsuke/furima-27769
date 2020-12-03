class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user_id || user_signed_in? && @item.order.present?
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_order
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :city, :address, :building, :number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_order
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

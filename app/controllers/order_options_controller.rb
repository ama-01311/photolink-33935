class OrderOptionsController < ApplicationController
  before_action :set_photo, only: [:index, :create]

  def index
    @order_option = OrderOptionOrder.new
  end

  def create
    #binding.pry
    @order_option = OrderOptionOrder.new(order_option_params)
    if @order_option.valid?
      pay_item
      @order_option.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_option_params
    params.require(:order_option_order).permit(:post_number, :prefecture_id, :municipality, :building, :address, :phone_number, :theme_id, :flame_id, :type_id)
          .merge(user_id: current_user.id, photo_id: params[:photo_id], order_option_id: params[:order_option_id], token: params[:token])
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

  def return_index
    redirect_to root_path unless current_user.id != @photo.user_id && @photo.order_option.nil?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @photo.selling_price + 500,
      card: order_option_params[:token],
      currency: 'jpy'
    )
  end

end

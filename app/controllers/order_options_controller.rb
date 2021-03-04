class OrderOptionsController < ApplicationController
  before_action :set_photo, only: [:index, :create]

  def index
    @order_option = OrderOptionOrder.new
  end

  def create
    @order_option = OrderOptionOrder.new(order_option_params)
    if @order_option.valid?
      @order_option.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_option_params
    params.require(:order_option_order).permit(:post_number, :prefecture_id, :municipality, :building, :address, :phone_number, :theme_id, :flame_id, :type_id)
          .merge(user_id: current_user.id, photo_id: params[:photo_id], order_option_id: params[:order_option_id])
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

  def return_index
    redirect_to root_path unless current_user.id != @photo.user_id && @photo.order_option.nil?
  end

end

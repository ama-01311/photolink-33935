class OrdersController < ApplicationController
  before_action :set_photo, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

  def order_params
    params.require(:order).merge(user_id: current_user.id, photo_id: params[:photo_id])
  end

  def return_index
    redirect_to root_path unless current_user.id != @photo.user_id && @photo.order_option.nil?
  end

end

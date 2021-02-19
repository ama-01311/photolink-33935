class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def photo_params
    params.require(:photo)
          .permit(:image, :photo_title, :photo_description, :photo_category_id, :photo_place_id, :selling_price)
          .merge(user_id: current_user.id)
  end
end

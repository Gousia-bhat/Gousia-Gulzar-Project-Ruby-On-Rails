class PhotosController < ApplicationController
  
  before_action :set_album, :set_user
  before_action :set_photo, only: [:show, :edit, :destroy, :update]
  def new
    @photo = @album.photos.build
  end

  def show
  end

  def edit
  end

  def create
    merged_params = photos_params.merge(user_id: params[:user_id])
    @photo = Photo.new(merged_params)
    byebug
    if @photo.save
      redirect_to user_album_path(current_user, @album)
    else
      render 'new'
    end
  end

  def update
    merged_params = photos_params.merge(user_id: params[:user_id])
    if @photo.update(merged_params)
      redirect_to user_album_path(current_user, @album)
    else
      render 'edit'
    end
  end

  def destroy
    
  end

  private

  def photos_params
    params.require(:photo).permit(:image, :tagline, :user_id, :album_id)
  end

  def set_album
    @album ||= Album.find(params[:album_id])
  end

  def set_user
    @user ||= User.find(params[:user_id])
  end

  def set_photo
    @photo ||= Photo.find(params[:id])
  end

end

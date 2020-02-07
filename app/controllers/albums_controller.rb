class AlbumsController < ApplicationController

  before_action :set_album, only: [:show, :edit, :destroy, :update]

  def index
    @albums = Album.all
  end
  
  def new
    @album = current_user.albums.build
  end

  def show
    @photos = Photo.where(album_id: @album.id)
  end

  def edit
    
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end

  def update
    if @album.update(album_params)
      redirect_to user_album_path(current_user, @album)
    else
      render 'edit'
    end
  end

  def destroy
    
  end

  private

  def album_params
    params.require(:album).permit(:name,:user_id)
  end

  def set_album
    @album ||= Album.find(params[:id])
  end
end

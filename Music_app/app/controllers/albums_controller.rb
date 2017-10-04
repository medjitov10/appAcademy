class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_path(@album.band.id)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(album_params)
    redirect_to band_path(@album.band.id)
  end

  def destroy
    @album = Album.find(params[:id])
    @album.delete
    redirect_to band_path(@album.band.id)
  end

  def album_params
    params.require(:album).permit(:title, :year, :live?)
  end

end

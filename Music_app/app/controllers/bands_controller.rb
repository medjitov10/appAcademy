class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
    flash[:error] = ""
    @band = Band.new
  end

  def create
    # debugger
    @band = Band.new(band_params)
    @band.user_id = current_user.id
    if @band.save
      redirect_to bands_path
    else
      flash[:error] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    @band.update_attributes(band_params)
    redirect_to bands_path
  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete
    redirect_to bands_path
  end

  def band_params
    params.require(:band).permit(:name)
  end
end

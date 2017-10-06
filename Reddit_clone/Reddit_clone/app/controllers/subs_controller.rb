class SubsController < ApplicationController

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
    @sub.update(sub_params)
    if @sub.save
      redirect_to sub_path(@sub)
    end

  end

  def new
    @sub = Sub.new
    
  end
  def update

  end

  def create
    #  debugger
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def sub_params
    params.require(:sub).permit(:description, :title)
  end

end

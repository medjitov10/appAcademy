require "byebug"
class UsersController < ApplicationController
  def index
    @users = User.all

  end

  def create

    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    if @user = User.find(params[:id])
      
    else
      render text: user.errors.full_messages, status: 404
    end
  end

  def new
    @user = User.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # debugger
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end

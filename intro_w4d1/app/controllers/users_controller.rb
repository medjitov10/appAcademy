require "byebug"
class UsersController < ApplicationController
  def index
    user = User.all
    render json: user
  end

  def create
    # debugger
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    if user = User.find(params[:id])
      render json: user
    else
      render text: user.errors.full_messages, status: 404
    end
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
    params.permit(:username)
  end
end

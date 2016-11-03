class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
     render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if @user
      render json: @user
    else
      render json: ["Please try again."], status: :unauthorized
    end
  end

  def index

  end

  def show

  end

  def delete

  end

  private

  def user_params
    params.permit(:username, :password, :firstname, :lastname, :avatar)
  end

end

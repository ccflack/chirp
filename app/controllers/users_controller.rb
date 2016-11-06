class UsersController < ApplicationController

  before_action :require_user, only: [:follow_unfollow]

  def index
    @users = User.all
    render json: @users, except: :api_token
  end

  def unfollowed
    if current_user
      @users = User.all
      @users -= current_user.followees(User)
      render json: @users
    else
      render json: @uses.errors.full_messages
    end
  end

  def followed
    if current_user
      @followed = current_user.followees(User)
      render json: @followed
    else
      render json: @uses.errors.full_messages
    end
  end

  def self
    @user = User.find_by(api_token: params[:api_token])
    if @user
      render json: @user, except: :api_token
    else
      render json: @user.errors.full_messages
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user,  except: :api_token
    else
      render json: ["User not found."], status: :bad_request
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
     render json: @user,  except: :api_token
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

  def follow_unfollow
    current_user.toggle_follow!(User.find(params[:id]))
    render json: current_user, except: :api_token
  end

  def all_followers
    @followers = User.find(params[:id]).followers(User)
    render json: @followers, except: :api_token
  end

  def followed
    @followees = User.find_by(api_token: params[:api_token]).followees(User)
    render json: @followees, except: :api_token
  end

  private

  def user_params
    params.permit(:username, :password, :firstname, :lastname, :avatar)
  end

end

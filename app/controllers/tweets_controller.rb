class TweetsController < ApplicationController

  before_filter :require_user, only: [:create, :index]


  def index
    if current_user
      @tweets = Tweet.timeline(current_user)
    else
      @tweets = Tweet.all
    end
    render json: @tweets
  end

  def show
    render json: @tweet
  end

  def create
    @tweet = Tweet.new(tweet_params)
    current_user.tweets << @tweet
    if @tweet.save
      render json: @tweet
    else
      render json: @tweet.errors.full_messages
    end
  end



  private

  def tweet_params
    params.permit(:body, :photo)
  end

end

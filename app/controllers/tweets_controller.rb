class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order("created_at DESC")
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end

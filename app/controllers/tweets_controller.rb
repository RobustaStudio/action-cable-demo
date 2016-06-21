class TweetsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @tweets = Tweet.all.order("created_at DESC")
  end

  def create
    @tweet = current_user.tweets.create! tweet_params

    ActionCable.server.broadcast "twitter_channel", tweet: render_tweet(@tweet)

    head :ok
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def render_tweet tweet
    render(partial: 'tweets/tweet', locals: { tweet: tweet })
  end
end

class TweetBroadcastJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    # Do something later
    ActionCable.server.broadcast "twitter_channel", content: render_tweet(tweet)
  end

  private
  def render_tweet tweet
    ApplicationController.renderer.render(partial: 'tweets/tweet', locals: { tweet: tweet })
  end
end

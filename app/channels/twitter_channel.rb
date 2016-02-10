# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class TwitterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "twitter_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def tweet data
    Tweet.create! content: data['content']
  end
end

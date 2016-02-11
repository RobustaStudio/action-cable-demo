# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class OnlineStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_status_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def appear
    ActionCable.server.broadcast "online_status_channel", user_email: current_user.email, status: 'appear'
  end

  def disappear
    ActionCable.server.broadcast "online_status_channel", user_email: current_user.email, status: 'disappear'
  end
end

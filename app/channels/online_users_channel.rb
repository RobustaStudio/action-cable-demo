# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class OnlineUsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_users_channel"
    $redis.sadd 'online', current_user.id
    ActionCable.server.broadcast "online_users_channel", users_html: render_online_users
  end

  def unsubscribed
    $redis.srem 'online', current_user.id
    ActionCable.server.broadcast "online_users_channel", users_html: render_online_users
  end

  private

  def render_online_users
    ApplicationController.renderer.render(partial: 'users/online_users')
  end
end

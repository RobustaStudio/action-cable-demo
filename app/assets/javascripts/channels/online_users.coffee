App.online_users = App.cable.subscriptions.create "OnlineUsersChannel",
  received: (data) ->
    $('#onlineUsers').html(data['users_html'])

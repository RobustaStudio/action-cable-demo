App.online_status = App.cable.subscriptions.create "OnlineStatusChannel",
  connected: ->
    @appear()
    # Called when the subscription is ready for use on the server

  disconnected: ->
    @disappear()
    # Called when the subscription has been terminated by the server

  received: (data) ->
    email = data['user_email']

    if data['status'] == 'appear'
      $('#onlineUsers').append("<p data-behavior='" + email + "'>" + email + "</p>")
    else if data['status'] == 'disappear'
      $("[data-behavior~=" + email + "]").remove()
    # Called when there's incoming data on the websocket for this channel

  appear: ->
    @perform 'appear'

  disappear: ->
    @perform 'disappear'

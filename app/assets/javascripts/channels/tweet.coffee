App.twitter = App.cable.subscriptions.create "TweetChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#tweets').prepend data['tweet']
    $('[data-behavior~=tweet_field]').val('')
    # Called when there's incoming data on the websocket for this channel

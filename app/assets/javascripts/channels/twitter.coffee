App.twitter = App.cable.subscriptions.create "TwitterChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#tweets').prepend data['content']
    # Called when there's incoming data on the websocket for this channel

  tweet: (content) ->
    @perform 'tweet', content: content # perform TwitterChannel#tweet

$(document).on 'keypress', '[data-behavior~=twitter_tweet]', (event) ->
  if event.keyCode is 13 # return = send
    App.twitter.tweet event.target.value
    event.target.value = ""
    event.preventDefault()

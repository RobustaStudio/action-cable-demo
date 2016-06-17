$ ->
  window.id = $('#recipient_field').attr('value')

  App.message = App.cable.subscriptions.create { channel: "MessageChannel", recipient: id },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#messages').append data['message']
      $('[data-behavior~=new_message_field]').val('')
      # Called when there's incoming data on the websocket for this channel

class MessagesController < ApplicationController
  def index
    p params.inspect
    @messages = Message.where recipient_id: params[:recipient]
  end

  def create
    @message = Message.create! message_params

    p "@!#!@#!@#@!#@!#!@#@! CONTROLLER >> #{params[:message][:recipient_id]}"

    ActionCable.server.broadcast "message_channel_#{params[:message][:recipient_id]}",
                                  message: render_message(@message)

    head :ok
  end

  private

  def message_params
   params.require(:message).permit(:content, :recipient_id)
                            .merge(sender_id: current_user.id)
  end

  def render_message(message)
    render(partial: 'messages/message', locals: { message: message })
  end
end

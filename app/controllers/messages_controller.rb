class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create! message_params

    ActionCable.server.broadcast "message_channel",
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

class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = @conversation.messages.create message_params
    ActionCable.server.broadcast "message_channel",
                                  message: render_message(@message)
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end

  def set_conversation
    @conversation = Conversation.mine(current_user).find(params[:conversation_id])
  end

  def render_message(message)
    render(partial: 'messages/message', locals: { message: message })
  end
end

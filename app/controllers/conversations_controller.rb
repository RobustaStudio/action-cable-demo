class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show]

  def index
    @conversations = Conversation.mine(current_user.id)
  end

  def show
  end

  def create
    @conversation = Conversation.between(current_user.id, params[:recipient_id]).first

    unless @conversation.present?
      @conversation = Conversation.create!(conversation_params) if User.where(id: params[:recipient_id]).present?
    end

    redirect_to @conversation
  end

  private

  def set_conversation
    @conversation = Conversation.mine(current_user).find(params[:id])
  end

  def conversation_params
    params.permit(:recipient_id).merge(sender_id: current_user.id)
  end

  def message_params
    params.permit(:body).merge(user_id: current_user.id)
  end
end

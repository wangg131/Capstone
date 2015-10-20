class ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    # sender is the user who initialized the conversation, but both users
    # will be sending and getting messages during a conversation
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],
      params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end

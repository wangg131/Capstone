class ConversationsController < ApplicationController
  before_filter :current_user
  
  def index
    # @conversations = Conversation.all
    if @user.user_type == 'host'
      @matches = Match.where(post_id: @user.post.id, host_approved_seeker?: true, seeker_approved_host?: true)
    elsif @user.user_type == 'seeker'
      @matches = Match.where(profile_id: @user.profile.id, host_approved_seeker?: true, seeker_approved_host?: true)
    end
  end

  def create
    # sender is the user who initialized the conversation, but both users
    # will be sending and getting messages during a conversation. A conversation
    # is only created if one doesn't already exist
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

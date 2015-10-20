class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  # Each message belongs to a conversation and a user id so we can tell who
  # sent each message in the conversation

  # Validations ----------------------------------------------------------------
  validates_presence_of :body, :conversation_id, :user_id

  # Model Methods --------------------------------------------------------------
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end

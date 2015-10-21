class Conversation < ActiveRecord::Base
  belongs_to :sender, class_name: User
  belongs_to :recipient, class_name: User

  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, :scope => :recipient_id

  # Scopes ---------------------------------------------------------------------
  # Checks to see if a conversation exists between sender & receiver so there is
  # only one conversation created between them.
  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR
    (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,
    recipient_id, recipient_id, sender_id)
  end
end


# user has sender or recipient flag, then can put scope... look through class of user

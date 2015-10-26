class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :matches
  validates_numericality_of :min_price, :max_price, :rooms_needed, :max_roommates,
  :max_roommates, only_integer: true
  #validates_presence_of :title :house_type :description,:neighborhoods, :rooms_needed, :bathroom_type.,
  # :min_price, :max_price, :cats, :dogs, :parking, :laundry, :max_roommates, :smoking,
  # :gender_preference, :date_needed)
  
  # Scopes ---------------------------------------------------------------------
  # Checks to see if a conversation exists between sender & receiver so there is
  # only one conversation created between them.
  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR
    (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,
    recipient_id, recipient_id, sender_id)
  end



end

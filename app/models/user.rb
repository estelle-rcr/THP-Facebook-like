class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'format must be xxx@yyy.zz'}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, length: {maximum: 257}, allow_blank: true

  belongs_to :city
  validates_associated :city
  has_many :written_gossips, foreign_key: 'author_id', class_name: "Gossip"
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "JoinTableMessageRecipient"
end

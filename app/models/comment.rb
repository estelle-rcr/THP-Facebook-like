class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 256 }
  belongs_to :user
  belongs_to :gossip
  validates_associated :gossip
  has_many :comment_children, class_name: "Comment", foreign_key: "comment_parent_id"
  belongs_to :comment_parent, class_name: "Comment", optional: true
  has_many :likes, as: :likeable
end

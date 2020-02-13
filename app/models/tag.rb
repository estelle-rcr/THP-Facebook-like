class Tag < ApplicationRecord
  validates :title, length: { maximum: 30 }
  has_many :join_table_gossip_tags
  has_many :gossips, through: :join_table_gossip_tags
end

class Like < ApplicationRecord
  belongs_to :user
  validates_associated :user
  belongs_to :likeable, polymorphic: true
end

class City < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, presence: true, uniqueness: true, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message:'the format must be one of a valid French zip code'}
  has_many :users
end

class Place < ApplicationRecord
  belongs_to :user
  has_many :comments

  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, length: { in: 3..50 }
  validates :description, presence: true, length: { in: 10..2000 }
  validates :address, presence: true, length: { in: 4..60 }
end

class Micropost < ApplicationRecord
  belongs_to :user

	has_many :favorite_relationships
	has_many :users, through: :favorite_relationships, source: :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end

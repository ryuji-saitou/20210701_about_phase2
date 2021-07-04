class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
		favorites.where(user_id: user).exists?
		# favorites.find_by(user_id: user).exists? (なぜexist?がmethod errorになる?)
	end
end
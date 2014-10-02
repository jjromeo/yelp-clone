class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy

	validates :name, length: {minimum: 3}, uniqueness: true

	def average_rating
		if self.reviews.any?
			(reviews.reduce(0) {|memo, review|memo + review.rating} / reviews.count)
		else
			'N/A'
		end
	end

end

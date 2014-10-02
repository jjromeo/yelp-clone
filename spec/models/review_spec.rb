require 'rails_helper'

RSpec.describe Review, type: :model do
	context 'when leaving a rating' do 
		it 'it accepts a rating between 1 and 5' do 
			review = Review.new(rating: 5)
			expect(review).to be_valid
		end

		it 'does not accept a rating outside of the 1-5 range' do 
			review = Review.new(rating: 6)
			expect(review).not_to be_valid
		end
	end
end

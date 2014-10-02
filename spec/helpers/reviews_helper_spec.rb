require 'rails_helper'

describe ReviewsHelper, type: :helper do 

	context 'Star rating system' do 

		it 'does nothing for not a number' do 
			expect(star_rating('N/A')).to eq 'N/A'
		end

		it 'returns ★★★★★ for a rating of 5' do 
			expect(star_rating(5)).to eq '★★★★★'
		end

		it 'returns ★★★☆☆ for a rating of 3' do 
			expect(star_rating(3)).to eq '★★★☆☆'
		end

	end

end





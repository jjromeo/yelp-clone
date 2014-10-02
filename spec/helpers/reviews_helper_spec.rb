require 'rails_helper'

describe ReviewsHelper, type: :helper do 

	context 'Star rating sytem' do 

		it 'does nothing for not a number' do 
			expect(star_helper('N/A')).to eq 'N/A'
		end

	end

end





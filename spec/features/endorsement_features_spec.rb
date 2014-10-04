require 'rails_helper'

xdescribe 'endorsing reviews' do
	
	context "while browsing a page with reviews" do 

	before {
		kfc = Restaurant.create(name: "kfc", description: "junk")
		kfc.reviews.create(rating: 1, thoughts: "Fatty food")
	}

		it "can endorse a review updating the review endorsement count", js: true do 
			visit '/restaurants'
			expect(page).to have_content '0 endorsements'
			click_link 'endorse this review'
			expect(page).to have_content '1 endorsement'
		end

	end


end
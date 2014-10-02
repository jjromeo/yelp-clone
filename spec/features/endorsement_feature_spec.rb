require 'rails_helper'

describe 'endorsing reviews' do
	before do 
		kfc = Restaurant.create(name: "kfc")
		kfc.reviews.create(rating: 1, thoughts: "Fatty food")
	end

	it "can endorse a review updating the review endorsement count" do 
		visit '/restaurants'
		expect(page).to have_content '0 endorsement'
		click_link 'endorse this review'
		expect(page).to have_content '1 endorsement'
	end


end
require 'rails_helper'

describe 'reviewing' do 
	before {
		Restaurant.create(name: 'Nandos')
	}


	def leave_review(thoughts=nil, score)
		visit '/restaurants'
		click_link 'Review Nandos'
		fill_in "Thoughts", with: thoughts
		select score, from: 'Rating'
		click_button 'Leave review'
	end

	it "allows users to leave reviews using the form which appears alongside restaurants" do 
		leave_review("DEcent", "4")
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content "DEcent"
		expect(page).to have_content 'Rating: ★★★★☆'
	end



	it "displays an average rating" do
		leave_review("DEcent", "3")	
		leave_review("Dece", "5")	
		expect(page).to have_content "Average rating: ★★★★☆"
	end

	def thirty_minutes_ago
		Time.now - (30 * 60)
	end


	context "When reviews are left" do 
		before do 
			Review.create(thoughts: "great", rating: "3", restaurant_id: Restaurant.first.id,  created_at: thirty_minutes_ago )
		end

		it 'tells you how long ago a review was' do
			visit '/restaurants'
			expect(page).to have_content '30 minutes ago'
		end


	end


end


require 'rails_helper'

describe 'reviewing' do 
	before {
		Restaurant.create(name: 'Nandos')
	}

	it "allows users to leave reviews using the form which appears alongside restaurants" do 
		visit '/restaurants'
		click_link 'Review Nandos'
		fill_in "Thoughts", with: "DEcent"
		select '4', from: 'Rating'
		click_button 'Leave review'
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content "DEcent"
		expect(page).to have_content 4
	end
end
require 'rails_helper'

describe 'restaurants' do 
	context 'When no restaurants have been added' do 
		it 'should display a prompt to add a restaurant' do 
			visit '/restaurants'
			expect(page).to have_content 'This is where your restaurants will show'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'When a restaurant has been added' do 
		before{
			Restaurant.create(name: 'Nandos')
		}

		it 'should display the restaurants' do 
			visit '/restaurants'
			expect(page).to have_content 'Nandos'
			expect(page).not_to have_content 'This is where your restaurants will show'
		end
	end
end
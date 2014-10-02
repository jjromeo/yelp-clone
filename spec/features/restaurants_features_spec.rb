require 'rails_helper'

describe 'restaurants' do 
	context 'When no restaurants have been added' do 
		it 'should display a prompt to add a restaurant' do 
			visit '/restaurants'
			expect(page).to have_content 'This is where your restaurants will show'
			expect(page).to have_link 'Add a restaurant'
			puts (page).html
		end
	end

	context 'When a restaurant has been added' do 
		before{
			Restaurant.create(	name: 'Nandos',
								description: 'A lovely chain of chicken')
		}

		it 'should display the restaurants' do 
			visit '/restaurants'
			expect(page).to have_content 'Nandos'
			expect(page).not_to have_content 'This is where your restaurants will show'
		end
	end

	context 'Adding a restaurant' do 
		context 'a valid restaurant' do
			it 'lets you add a restaurant' do
				visit '/restaurants'
				click_link 'Add a restaurant'
				expect(page).to have_content 'Add a restaurant here'
				fill_in 'Name', with: 'Nandos'
				fill_in 'Description', with: 'A lovely chain of chicken'
				click_button 'Create Restaurant'
				expect(page).to have_content 'Nandos'
				# expect(page).to have_content 'A lovely chain of chicken'
				expect(current_path).to eq '/restaurants'
			end
		end

		context 'an invalid restaurant' do 
			it 'does not let you add an invalid one' do 
				visit '/restaurants'
				click_link 'Add a restaurant'
				fill_in 'Name', with: 'Na'
				click_button 'Create Restaurant'
				expect(page).to have_content 'error'
			end
		end
	end

	describe 'editing restaurants' do
		before {
			Restaurant.create(name: 'Nandos')
		}

		it 'can allow a user to edit a restaurant' do 
			visit '/restaurants'
			click_link 'Edit Nandos'
			fill_in 'Name', with: 'Nandinhos'
			click_button 'Update Restaurant'
			expect(page).to have_content "Nandinhos"
			expect(current_path).to eq '/restaurants'
		end
	end

	describe 'deleting a restaurant' do 
		before {
			Restaurant.create(name: 'Nandos')
		}

		it 'can allow user to delete a restaurant' do 
			visit '/restaurants'
			click_link 'Delete Nandos'
			# click_button 'Yes'
			expect(page).not_to have_content "Nandos"
			expect(page).to have_content "Restaurant deleted successfully"
		end
	end

	describe 'showing restaurant details' do 
		before {
			Restaurant.create(name: 'Nandos', description: 'A lovely chain of chicken')
		}
		it 'can show you details upon clicking a restaurant' do
			visit '/restaurants'
			click_link 'Show Nandos'
			expect(page).to have_content "Nandos"
			expect(page).to have_content "A lovely chain of chicken"
		end
	end


end
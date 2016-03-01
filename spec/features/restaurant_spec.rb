feature 'Create a restaurant' do
  scenario 'with name and rating' do
    visit('/')
    click_link('Add a Restaurant')
    fill_in('Name', with: 'Nando\'s')
    fill_in('Rating', with: 2)
    click_button('Create Restaurant')
    expect(page).to have_content('Nando\'s 2')
  end
end

feature 'Restaurants can be modified' do 
	scenario 'by editing' do
		create_restaurant
		click_link('Edit')
		fill_in('Name', with: 'Fried Chicken World')
    fill_in('Rating', with: 4)
		click_button('Edit Restaurant')
		expect(page).to have_content('Fried Chicken World 4')  
	end

  scenario 'by deleting' do
    create_restaurant
    click_link('Delete')
    expect(page).not_to have_content('Nando\'s 2')
    expect(current_path).to eq('/restaurants')  
  end



end

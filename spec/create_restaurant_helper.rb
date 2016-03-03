def create_restaurant(name)
	click_link 'Add a restaurant'
	fill_in 'Name', with: name
	click_button 'Create Restaurant'
end
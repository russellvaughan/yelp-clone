 def create_restaurant
 	visit('/')
 	click_link('Add a Restaurant')
 	fill_in('Name', with: 'Nando\'s')
 	fill_in('Rating', with: 2)
 	click_button('Create Restaurant')
 end
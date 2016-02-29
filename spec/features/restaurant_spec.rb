feature 'Create a restaurant' do
  scenario 'with name and rating' do
    visit('/')
    click_link('Add a Restaurant')
    fill_in('name', with: 'Nando\'s')
    fill_in('rating', with: 2)
    click_button('Create Restaurant')
    expect(page).to have_content('Nando\'s 2')
  end
end
feature 'User can review restaurant' do
  scenario 'leave comment and rating' do
    create_restaurant
    click_link "Nando's"
    fill_in "Comment", with: "Average"
    fill_in "Rating", with: 3
    click_button "Submit Review"
    expect(current_path).to eq('/restaurants/1')
    expect(page).to have_content("Average, 3")
  end
end

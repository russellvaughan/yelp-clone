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

feature 'Page features all reviews' do
  scenario 'When user visits restaurant page' do
    create_restaurant
    click_link "Nando's"
    expect(current_path).to eq('/restaurants/1')
    fill_in "Comment", with: "Average"
    fill_in "Rating", with: 3
    click_button "Submit Review"
    expect(current_path).to eq('/restaurants/1')
    fill_in "Comment", with: "Great"
    fill_in "Rating", with: 5
    click_button "Submit Review"
    expect(page).to have_content("Average, 3 Great, 5")
  end
end


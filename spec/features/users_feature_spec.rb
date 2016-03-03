require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')

    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up_and_in
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  context "unless logged in" do
    it "should not be able to create a new restaurant" do
      visit('/')
      expect(page).not_to have_link('Add a restaurant')
    end
  end
end

feature 'User can only edit restaurants which they have created' do
  before do
    sign_up_and_in
    create_restaurant('kfc')
    sign_up_and_in_2
  end

  it "cannot edit another users restaurant" do
    expect(page).not_to have_link('Edit kfc')
  end
end
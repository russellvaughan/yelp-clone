def sign_up_and_in
  visit('/')
  #click_link('Sign up')
  page.all(:link,'Sign up')[0].click
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_and_in_2
  visit('/')
  #click_link('Sign up')
  page.all(:link,'Sign up')[0].click
  fill_in('Email', with: 'another_test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
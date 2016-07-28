def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  expect(page).to have_content 'Sign up'
  fill_in :email,    with: 'test@test.com'
  fill_in :password, with: 'password'
  click_button 'Sign up'
end

def sign_up(email: 'TC@makers.academy.com', password: 'kiwi', password_confirmation: 'kiwi')
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
end

def sign_in
  visit '/sessions/new'
  fill_in :email, with: 'TC@makers.academy.com'
  fill_in :password, with: 'kiwi'
  click_button('Sign in')
end

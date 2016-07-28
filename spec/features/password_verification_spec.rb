feature 'User sign up' do

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password and confirmation password do not match')
    expect(page).to have_selector("input[value='test@test.com']")
  end

  def sign_up(email:                  'test@test.com',
              password:               'password',
              password_confirmation:  'password')
    visit '/users/new'
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end

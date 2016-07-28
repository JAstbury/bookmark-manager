require_relative 'web_helper'

feature 'Signing up' do
  scenario 'I can sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, test@test.com')
    expect(User.first.email).to eq 'test@test.com'
  end

  scenario 'I can\'t sign up with out a email address' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'I can\'t sign up with an invalid email address' do
    expect{ sign_up(email: "invalid@email" ) }.not_to change(User, :count)
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

require_relative 'web_helper'

feature 'Signing up' do
  scenario 'I can sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, test@test.com')
    expect(User.first.email).to eq 'test@test.com'
  end

  scenario 'I can\'t sign up with out a email address' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I can\'t sign up with an invalid email address' do
    expect{ sign_up(email: "invalid@email" ) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I can\'t sign up with an existing email address' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
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

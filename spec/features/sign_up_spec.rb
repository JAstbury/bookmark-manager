require_relative 'web_helper'

feature 'Signing up' do
  scenario 'I can sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, test@test.com')
    expect(User.first.email).to eq 'test@test.com'
  end
end
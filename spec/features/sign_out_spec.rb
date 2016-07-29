require 'spec_helper'
require './app/app.rb'

feature 'sign up' do
  scenario 'a user signs out' do
  sign_up
  sign_out
  expect(page).to have_content('Goodbye!')
  expect(page).not_to have_content('Welcome, TC@makers.academy.com')
  expect(current_path).to eq('/links')
  end
end

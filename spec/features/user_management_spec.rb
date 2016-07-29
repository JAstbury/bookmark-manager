require 'spec_helper'
require 'web_helper'
require './app/models/user.rb'

feature 'User sign in' do
  scenario 'requires a matching confirmation password' do
    expect{ sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
    expect(page).to have_selector("input[value='TC@makers.academy.com']")
  end

  scenario 'can not sign up with same email twice' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

end

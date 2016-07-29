require 'spec_helper'
require 'web_helper'
require './app/models/user.rb'

feature 'User sign in' do
  scenario 'requires a matching confirmation password' do
    expect{ sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
    expect(page).to have_selector("input[value='TC@makers.academy.com']")
  end

end

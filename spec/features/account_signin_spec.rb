require 'spec_helper'
require 'web_helper'
require './app/models/user.rb'

feature 'sign in' do
  scenario 'existing user can sign into their account' do
    sign_up
    expect{sign_in}.not_to change(User, :count)
    expect(page).to have_content 'Welcome, TC@makers.academy.com'
  end
end

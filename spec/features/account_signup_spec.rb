require 'spec_helper'
require 'web_helper'
require './app/models/user.rb'

feature 'users can signin' do

  scenario 'user signs up' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(User.first.email).to eq('TC@makers.academy.com')
    expect(page).to have_content('Welcome, TC@makers.academy.com')
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end
  
end

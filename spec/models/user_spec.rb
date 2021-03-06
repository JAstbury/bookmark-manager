describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: 'secret1234', password_confirmation: 'secret1234')
  end

  it 'authenticates an existing user when they sign in' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

end

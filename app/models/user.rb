require 'bcrypt'
require 'dm-validations'

class User

include DataMapper::Resource

attr_reader :password
attr_accessor :password_confirmation
validates_confirmation_of :password, :confirm => :password_confirmation

  property :id, Serial
  property :email, String, required: true, unique: true, format: :email_address
  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end

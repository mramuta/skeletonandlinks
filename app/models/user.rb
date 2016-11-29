require 'bcrypt'
class User < ActiveRecord::Base
  has_many :entries, foreign_key: :author_id
  has_many :comments

  def password
    @password ||= BCrypt::Password.new(hash_pass)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hash_pass = @password
  end

  def self.authenticate(username,password)
    user = User.find_by(username:username)
  	if user
  		return true if user.password.==(password)
  	end
    false
  end

end

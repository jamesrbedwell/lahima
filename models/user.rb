class User < ActiveRecord::Base
  has_secure_password #add three methods for you.
  # column name needs to be password_digest
  # u1.password
  # u1.password =
  # User.authenticate
  has_many :workers
  has_many :clients
end
class User < ActiveRecord::Base
  has_secure_password #add three methods for you.
  # column name needs to be password_digest
  # u1.password
  # u1.password =
  # User.authenticate
  has_many :workers
  has_many :clients
  has_many :projects, through: :clients
  has_many :client_contacts, through: :projects
  has_many :worker_jobs, through: :workers
  has_many :client_jobs, through: :projects

end
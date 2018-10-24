class Client < ActiveRecord::Base
  belongs_to :user
  has_many :projects
  has_many :client_contacts
  has_many :jobs, through: :projects
end
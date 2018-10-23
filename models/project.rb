class Project < ActiveRecord::Base
  belongs_to :client_contact
  has_many :jobs
end
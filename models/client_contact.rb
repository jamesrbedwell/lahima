class ClientContact < ActiveRecord::Base
  belongs_to :client
  has_many :projects
end
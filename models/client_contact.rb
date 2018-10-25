class ClientContact < ActiveRecord::Base
  belongs_to :client
  belongs_to :project

  def full_name
    "#{first_name} #{last_name}"
  end
end
class Worker < ActiveRecord::Base
  belongs_to :user
  has_many :jobs

  def self.available
    where(available: 't')
  end

  def full_name 
    "#{first_name} #{last_name}"
  end

end
class Worker < ActiveRecord::Base
  belongs_to :user
  has_many :jobs

  def self.unassigned
    where(user_id: nil)
  end

  def self.available
    where(available: 't')
  end

  def self.unavailable 
    where(available: 'f')
  end

  def self.avail_labourers
    where(available: 't', worker_type: 'Labourer')
  end

  def self.avail_ticketed
    where(available: 't', worker_type: 'Ticketed')
  end
 
  def self.avail_carpenters
    where(available: 't', worker_type: 'Carpenter')
  end

  def full_name 
    "#{first_name} #{last_name}"
  end

  def available?
    available ? true : false
  end
end
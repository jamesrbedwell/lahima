class Job < ActiveRecord::Base
  belongs_to :project
  belongs_to :worker

  def self.unfilled
    where(status: 'unfilled')
  end

  def self.filled
    where(status: 'filled')
  end

  def self.working
    where(status: 'working')
  end
  
  def self.finished
    where(status: 'finished')
  end
end
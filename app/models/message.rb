class Message < ActiveRecord::Base
  validates_presence_of :from, :body, :datetime
  
  def to_s
    self.from 
  end

end

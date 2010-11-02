class Event < ActiveRecord::Base
  validates_presence_of :name, :description, :datetime, :price
  has_and_belongs_to_many :users
  
  def to_s
    "#{self.name}, (#{self.datetime})" 
  end
  
  def register_user(user)
    if user != nil
      if !is_user_registred(user) 
        users << user
      end
    end
  end
  def unregister_user(user)
    if user != nil
      users.delete(user)
    end
  end  
  
  def is_user_registred(user)
    if user != nil
      condition = "user_id = #{user.id}" 
      res = users.count(:conditions => condition)
      res > 0 
    end
  end
end

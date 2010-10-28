class Event < ActiveRecord::Base
  validates_presence_of :name, :description, :datetime, :price
  #has_and_belongs_to_many :members
  
  def to_s
    "#{self.name}, (#{self.datetime})" 
  end
  def register_member(member)
    if !is_member_registred(member) 
      members << member
    end
  end
  def unregister_member(member)
    members.delete(member)
  end  
  
  def is_member_registred(member)
   condition = "member_id = #{member.id}" 
   res = members.count(:conditions => condition)
   res > 0 
    
  end
end





class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable,   #:confirmable, 
    :recoverable,     :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
    :firstname, :lastname, :title,:organization ,:city,:state,:country, :note, :is_admin 
  
  def to_s
    [self.lastname, self.firstname ].join(", ")
  end
end

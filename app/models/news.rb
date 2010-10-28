class News < ActiveRecord::Base
 def to_s
    "#{self.title}, (#{self.datetime})" 
  end
end

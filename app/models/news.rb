class News < ActiveRecord::Base
 def to_s
    "#{self.title}, (#{self.datetime})" 
  end
   
  def light_news()
   News.all(:limit =>3, :conditions => "datetime >= #{Date.today.to_s(:db)}", :order => "datetime desc" )
  end
end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  layout "welcome"
  
  before_filter :initVars
  
  def initialize
    @page_title = "Agile Maroc" 
    @page_title_slogon ="Pour un échange d'expertise sur les approches agiles de développement logiciel au Maroc."
    @section=""
  end
  
  #  def index
  #    #   @page_title = "Agile Maroc" 
  #    #   @page_title_slogon ="Pour un échange d'expertise sur les approches agiles de développement logiciel au Maroc."
  #    #   
  #  end
  #  
  #  def self.section
  #    "Undefined"
  #  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def authenticate_user_admin
    authenticate_user! && current_user.is_admin
    
  end 
  
   # Devise: Where to redirect users once they have logged in 
 # def after_sign_in_path_for(resource) 
 #   "http://www.google.com" # <- Path you want to redirect the user to. 
 # end 

  private
  def initVars
    @page_title = "Agile Maroc" 
    @page_title_slogon ="Pour un échange d'expertise sur les approches agiles de développement logiciel au Maroc."
    @section=""
  end
end


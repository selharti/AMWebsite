# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
    
  layout "welcome"
    
  def initialize
    @page_title = "Agile Maroc" 
    @page_title_slogon ="Pour un échange d'expertise sur les approches agiles de développement logiciel au Maroc."
    @section=""
  end
  
  def index
    #   @page_title = "Agile Maroc" 
    #   @page_title_slogon ="Pour un échange d'expertise sur les approches agiles de développement logiciel au Maroc."
    #   
  end
  
  def self.section
    "Undefined"
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
   def authenticate_user_admin
    authenticate_user! && current_user.is_admin
#    if session[:member] == nil || !session[:member].is_administrator # must be h_currentUser
#        session[:original_uri] = request.request_uri
#        flash[:notice] = "Désolé, Accès non autorisé :("
#        redirect_to(:controller => "login", :action => "login")
#    end
  end 
  private
#  def authorize
#    unless session[:member] != nil and Member.find_by_id(session[:member].id)
#      session[:original_uri] = request.request_uri
#      flash[:notice] = "Connectez vous svp... ;)"
#      redirect_to(:controller => "login", :action => "login")
#    end
#  end
  

end
#
#class DeviseController::DeviseFeaturesController
#    layout "welcome" 
#  
#end

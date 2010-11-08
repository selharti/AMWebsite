module EventsHelper
  
  #register  unregister a member
  def registerUnregister (event, user)
    if user != nil 
      if event.is_user_registred(user) 
        "TMP - Vous êtes déjà enregistré #{link_to 'se désinscrire', :action => :unregister, :id => event}"
       # "Vous êtes déjà enregistré"
      else
        link_to t("Register"), :action => :register, :id => event #, :user_id => user
      end
    else
      #link_to "s'inscrire", :action => :register, :id => event
    #  link_to t('devise.sessions.link'), new_session_path(event)
    link_to t("sign_in_formEvent"), :action => :register, :id => event # new_user_session_path 
      #redirect_to :conrtoller => "User", :action => "sign_in"  # request.request_uri) #, :path => "users/sign_in"
    end
  end
  
 
  #  relpace price by free if it applies 
  def h_price(value)   
    if value== 0.0 
    "Gratuit" 
    else
      value
    end
  end  
end

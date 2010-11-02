module EventsHelper
  
  #register  unregister a member
  def registerUnregister (event, user)
    if user != nil 
      if event.is_user_registred(user) 
        "Vous êtes déjà<br>enregistré #{link_to 'se désinscrire', :action => :unregister, :id => event}"
      else
        link_to "s'inscrire", :action => :register, :id => event
      end
    else
      #link_to "s'inscrire", :action => :register, :id => event
    #  link_to t('devise.sessions.link'), new_session_path(event)
    link_to t("sign_in"), new_user_session_path 
      #redirect_to :conrtoller => "User", :action => "sign_in"  # request.request_uri) #, :path => "users/sign_in"
    end
  end
  
  # Convert month to text
  def h_month_to_string(month, shortformat) 
    months=[ "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octore", "Novembre", "Décembre"]
    if 0 < month and month < 13 
      res = months[month] 
    else
      res = "Invalide"
    end
    # short name
    if shortformat and month != 5
      res = res.first(3)+ "."
    end
    res
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

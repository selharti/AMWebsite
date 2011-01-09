module EventsHelper
  
  #register  unregister a member
  def registerUnregister (event, user)
    if event.datetime.to_date >= Date.today 
      if user != nil 
        if event.is_user_registred(user) 
          "Vous êtes inscrit(e) #{link_to 'se désinscrire', :action => :unregister, :id => event}"
         # "Vous êtes déjà enregistré"
        else
          link_to t("Register"), :action => :register, :id => event #, :user_id => user
        end
      else
        # if event.maxaudience != nil && event.maxaudience > 0 && event.users.count >= event.maxaudience
        if !event.is_registration_open
            "Désolé, mais l'inscription à cet évenement est fermée. Merci pour votre compréhension."
          else
            link_to t("sign_in_formEvent"), :action => :register, :id => event # new_user_session_path 
        end
      end
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

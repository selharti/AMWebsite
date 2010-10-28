module EventsHelper
  
  #register  unregister a member
  def registerUnregister (event, member)
    if member != nil and event.is_member_registred(member) 
      "Vous êtes déjà<br>enregistré #{link_to 'se désinscrire', :action => :unregister, :id => event}"
    else
      link_to "s'inscrire", :action => :register, :id => event
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

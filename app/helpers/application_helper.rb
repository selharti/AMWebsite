# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # -------------------------------------------------------
  # Formating
  
  # CRUD Links
  def crud_link_to(path, image, options=nil)
    if current_user != nil and current_user.is_admin != nil and current_user.is_admin
      link_to(image_tag(image, :size => "20x20", :border => 0), path, options) unless current_user == nil || !current_user.is_admin
    end
  end
  # CRUD - new
  def crud_link_to_add(new_item_path)
    crud_link_to(new_item_path , '/images/crud-add.png' ) 
  end
  # CRUD - edit
  def crud_link_to_edit(edit_item_path)
    crud_link_to(edit_item_path, "/images/crud-edit.png") 
  end
  # CRUD - delete
  def crud_link_to_delete(item)
    crud_link_to(item, "/images/crud-delete.png", :confirm => "êtes-vous sûre de vouloir supprimer l'élèment: #{item.to_s}?", :method => :delete )  
  end
  
  def crud_link_to_withTD(adtion, path, item, span, styleclass)
  # if h_currentUser != nil and  h_currentUser.is_administrator
  if user_signed_in? and current_user.is_admin != nil and current_user.is_admin
    res = "<td colspan=#{span} class=#{styleclass}>" 
    res += case adtion
      when 'new' then "#{crud_link_to(path , '/images/crud-add.png' )}" 
      when 'edit' then crud_link_to(path, '/images/crud-edit.png')
      when 'delete' then crud_link_to(item, "/images/crud-delete.png", :confirm => "êtes-vous sûre de vouloir supprimer l'élèment: #{item.to_s}?", :method => :delete )  
    end
    res += "</td>"
   end
      
    #link_to(image_tag(image, :size => "30x30", :border => 0), path, options) unless h_currentUser == nil || !h_currentUser.is_administrator
  end 
  
  
  #table - alternate rows styles
  def row_alternate_style(rownumber)
    if rownumber%2 == 0
      "class='row-even'" 
    else
      "class='row-odd'"
    end
  end
  # -------------------------------------------------------
  # secured link

  def secured_link_to(label, path)
 "| #{link_to(label, path)}" unless !user_signed_in? || !current_user.is_admin #
   # link_to(label, path) unless h_currentUser == nil || !h_currentUser.is_administrator
   #link_to(image_tag(image, :size => "30x30", :border => 0), path, options) unless h_currentUser == nil || !h_currentUser.is_administrator
  end
  # -------------------------------------------------------
  def h_currentUser
    session[:member]
  end
  def welcome_connect
      if h_currentUser == nil 
        #res = "| <a href='/login/login'>se connecter</a>"
        res = " | #{link_to('se connecter', '/login/login')} "
        #link_to('se connecter', '/login/login')
      else #-- # # " | <a href='/members/#{h_currentUser.id}/edit'>profil</a> "
        res = "Bienvenue #{h_currentUser.lastname}" 
        if h_currentUser.is_administrator
          res += " (Admin) " 
        end
        path="/members/#{h_currentUser.id}/edit"
        res +=" | #{link_to('profil', path)}" 
        res +=" | #{link_to('se déconnecter', '/login/logout')}" #  | <a href='/login/logout'>se déconnecter</a> "
    end
    res
  end
  
 end

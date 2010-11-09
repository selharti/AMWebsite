class EventsController < ApplicationController
  
  layout "welcome" 
  helper :date_format
  before_filter :authenticate_user!, :except =>[:index, :show,  :unregister] 
  
  before_filter :authenticate_user_admin, :except =>[:index, :show, :register,  :unregister] 
 # before_filter :authenticate_user, :except =>[:index, :show,  :unregister] 

  before_filter :initVars 
  
  # GET /events
  # GET /events.xml 
  def index
    @events = Event.all(:conditions => "datetime >= #{Date.today.to_s(:db)}", :order => "datetime" )
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end
  
  def indexlight
    @events = Event.all(:limit =>3, :conditions => "datetime >= #{Date.today.to_s(:db)}", :order => "datetime" )
    respond_to do |format|
      format.html
      format.xml  { render :xml => @events }
    end
  end
  
  ## Regsiter 2010-10-04
  def register
    # link the user to the event
    # get the event  
    @event = Event.find(params[:id])  
    if @event == nil 
          flash[:error]="Une erreur s'est produite lors de l'inscription" 
          redirect_to(:action => :index)
    end
    # get the user from the session
    @user = current_user 
    @event.register_user(@user)
    
    # send confirmation email
    email = EventMailer.create_confirm(@user, @event)
    email.set_content_type("text/html")     
    email.charset = 'uft-8' 
    #keep for test
    #render (:text => "<pre>" + email.encoded + "</pre>" )
    #return
   # EventMailer.deliver(email)
    flash[:notice]="Merci pour votre inscription. Un message vous a été envoyé." 
    redirect_to(:action => :index)
  end
  
  def unregister
    @user = current_user 
    # get the event  
    @event = Event.find(params[:id])
    @event.unregister_user(@user)
    redirect_to(:action => :index)
  end
  
  
  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end
  
  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end
  
  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end
  
  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    
    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])
    
    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  private  
  def initVars
    @section = t("Events")
  end
  
end

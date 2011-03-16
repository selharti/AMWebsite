class MassmailsController < ApplicationController
  # GET /massmails
  # GET /massmails.xml

  layout "welcome"
  before_filter :authenticate_user_admin
  
  def index
    @massmails = Massmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @massmails }
    end
  end
  def abcd
     # send confirmation email
   email = Massmailer.create_send(Time.now)
    email.set_content_type("text/html")     
    email.charset = 'uft-8' 
    #keep for test
    #render (:text => "<pre>" + email.encoded + "</pre>" )
    #return
    Massmailer.deliver(email)
  #  flash[:notice]="Votre message a étét envoyé." 
  #  redirect_to(:action => :index)
  end

  # GET /massmails/1
  # GET /massmails/1.xml
  def show
    @massmail = Massmail.find(params[:id])  

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @massmail }
    end
  end

  # GET /massmails/new
  # GET /massmails/new.xml
  def new
    @massmail = Massmail.new
    @massmail.from = "contact@agilemaroc.org (Agile Maroc)" 
    @massmail.to = "contact@agilemaroc.org (Agile Maroc)" 
    @massmail.sentbyuser = current_user.to_s() 
    @massmail.datetimecreated = Time.now.to_s()
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @massmail }
    end
  end

  # GET /massmails/1/edit
  def edit
    @massmail = Massmail.find(params[:id])
  end

  # POST /massmails
  # POST /massmails.xml
  def create
    @massmail = Massmail.new(params[:massmail])

    respond_to do |format|
      if @massmail.save
        flash[:notice] = 'Massmail was successfully created.'
        format.html { redirect_to(@massmail) }
        format.xml  { render :xml => @massmail, :status => :created, :location => @massmail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @massmail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /massmails/1
  # PUT /massmails/1.xml
  def update
    @massmail = Massmail.find(params[:id])
abcd
    respond_to do |format|
      if @massmail.update_attributes(params[:massmail])
        flash[:notice] = 'Massmail was successfully updated.'
        format.html { redirect_to(@massmail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @massmail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /massmails/1
  # DELETE /massmails/1.xml
  def destroy
    @massmail = Massmail.find(params[:id])
    @massmail.destroy

    respond_to do |format|
      format.html { redirect_to(massmails_url) }
      format.xml  { head :ok }
    end
  end
  
  private  
  def initVars
    @section = t("MassMail")
  end
  
  def sharedcrud
    @action = params[:withaction] 
    @massmail = params[:massmail]
    respond_to do |format|
      format.html
      format.xml  { render :xml => @massmail }
    end
    
  end
end

class MessagesController < ApplicationController
  # layout "welcome" 
  before_filter :authenticate_user_admin, :except =>[:new] 
  before_filter :initVars
  
  ## =================
  def index
    @messages = Message.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end
  
  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end
  
  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new
    @message.datetime= Time.now
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end
  
  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end
  
  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    
    respond_to do |format|
      @message.datetime= Time.now
      if @message.save
        flash[:notice] = "Merci d'avoir envoyer ce message"
        format.html { redirect_to("/welcome") }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])
    
    respond_to do |format|
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to(@message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    
    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def initVars
    
    @section = t("Message")
  end
  
  
  ## =============
end

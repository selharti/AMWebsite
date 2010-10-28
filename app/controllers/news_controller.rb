class NewsController < ApplicationController
   layout "welcome" 
  #helper :date_format
  #  before_filter :authorize_admin, :except =>[:index, :show, :register, :unregister] 
  #  before_filter :authorize, :only =>[:register, :unregister] 

 def initialize
   super
   @section = "Nouvelles"
 end
  
  
  
  # GET /news
  # GET /news.xml
  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/1
  # GET /news/1.xml
  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/new
  # GET /news/new.xml
  def new
    @news_item = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_item }
    end
  end

  # GET /news/1/edit
  def edit
    @news_item = News.find(params[:id])
  end

  # POST /news
  # POST /news.xml
  def create
    @news_item = News.new(params[:news])

    respond_to do |format|
      if @news_item.save
        flash[:notice] = 'News was successfully created.'
        format.html { redirect_to(news_item_path(@news_item)) }
        format.xml  { render :xml => @news_item, :status => :created, :location => news_item_path(@news_item) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.xml
  def update
    @news_item = News.find(params[:id])

    respond_to do |format|
      if @news_item.update_attributes(params[:news])
        flash[:notice] = 'News was successfully updated.'
        format.html { redirect_to(news_item_path(@news_item)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.xml
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to(news_url) }
      format.xml  { head :ok }
    end
  end
end

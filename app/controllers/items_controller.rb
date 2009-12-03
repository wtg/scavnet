class ItemsController < ApplicationController
  # Require user to be logged in before getting to critical pages.
  # Actual authorization to edit or create will be checked later.
  before_filter :logged_in_filter, :except => [:show, :index]

  # GET /items
  # GET /items.xml
  def index
    @items = Item.find(:all, :conditions => ['expiration > ?', DateTime.now], :order => 'expiration ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
    @item.quantity = 1
    @item.expiration = 10.days.from_now

    # The only effect of this line will be for admins: when adding a new
    # item they get to change the user, although they will be the default.
    # For everyone else, the user gets added at submissions.
    # Note we know the user is logged in when they get here.
    @item.user = current_user 
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end

  def search
    if params[:query].blank?
      items = Item.find(:all, :conditions => ['expiration > ?', DateTime.now], :order => 'expiration ASC')
    else
      all_items = Item.find_with_index(params[:query])
      items = all_items.select{|i| i.expiration > DateTime.now}
    end
    if request.xhr?
      render :partial => 'table', :locals => {:items => items}    
    else
      @items = items
      render :action => 'index'
    end
  end

end

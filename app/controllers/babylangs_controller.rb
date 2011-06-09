class BabylangsController < ApplicationController
  # GET /babylangs
  # GET /babylangs.xml
  def index
    @babylangs = Babylang.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @babylangs }
    end
  end

  # GET /babylangs/1
  # GET /babylangs/1.xml
  def show
    @babylang = Babylang.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @babylang }
    end
  end

  # GET /babylangs/new
  # GET /babylangs/new.xml
  def new
    @babylang = Babylang.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @babylang }
    end
  end

  # GET /babylangs/1/edit
  def edit
    @babylang = Babylang.find(params[:id])
  end

  # POST /babylangs
  # POST /babylangs.xml
  def create
    @babylang = Babylang.new(params[:babylang])

    respond_to do |format|
      if @babylang.save
        format.html { redirect_to(@babylang, :notice => 'Babylang was successfully created.') }
        format.xml  { render :xml => @babylang, :status => :created, :location => @babylang }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @babylang.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /babylangs/1
  # PUT /babylangs/1.xml
  def update
    @babylang = Babylang.find(params[:id])

    respond_to do |format|
      if @babylang.update_attributes(params[:babylang])
        format.html { redirect_to(@babylang, :notice => 'Babylang was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @babylang.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /babylangs/1
  # DELETE /babylangs/1.xml
  def destroy
    @babylang = Babylang.find(params[:id])
    @babylang.destroy

    respond_to do |format|
      format.html { redirect_to(babylangs_url) }
      format.xml  { head :ok }
    end
  end
end

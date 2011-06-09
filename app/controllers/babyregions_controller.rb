class BabyregionsController < ApplicationController
  # GET /babyregions
  # GET /babyregions.xml
  layout 'application'
  def index
    @babyregions = Babyregion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @babyregions }
    end
  end

  # GET /babyregions/1
  # GET /babyregions/1.xml
  def show
    @babyregion = Babyregion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @babyregion }
    end
  end

  # GET /babyregions/new
  # GET /babyregions/new.xml
  def new
    @babyregion = Babyregion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @babyregion }
    end
  end

  # GET /babyregions/1/edit
  def edit
    @babyregion = Babyregion.find(params[:id])
  end

  # POST /babyregions
  # POST /babyregions.xml
  def create
    @babyregion = Babyregion.new(params[:babyregion])

    respond_to do |format|
      if @babyregion.save
        format.html { redirect_to(@babyregion, :notice => 'Babyregion was successfully created.') }
        format.xml  { render :xml => @babyregion, :status => :created, :location => @babyregion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @babyregion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /babyregions/1
  # PUT /babyregions/1.xml
  def update
    @babyregion = Babyregion.find(params[:id])

    respond_to do |format|
      if @babyregion.update_attributes(params[:babyregion])
        format.html { redirect_to(@babyregion, :notice => 'Babyregion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @babyregion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /babyregions/1
  # DELETE /babyregions/1.xml
  def destroy
    @babyregion = Babyregion.find(params[:id])
    @babyregion.destroy

    respond_to do |format|
      format.html { redirect_to(babyregions_url) }
      format.xml  { head :ok }
    end
  end
end

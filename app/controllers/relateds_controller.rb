class RelatedsController < ApplicationController
  # GET /relateds
  # GET /relateds.xml
  def index
    @relateds = Related.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relateds }
    end
  end

  # GET /relateds/1
  # GET /relateds/1.xml
  def show
    @related = Related.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @related }
    end
  end

  # GET /relateds/new
  # GET /relateds/new.xml
  def new
    @related = Related.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @related }
    end
  end

  # GET /relateds/1/edit
  def edit
    @related = Related.find(params[:id])
  end

  # POST /relateds
  # POST /relateds.xml
  def create
    @related = Related.new(params[:related])

    respond_to do |format|
      if @related.save
        format.html { redirect_to(@related, :notice => 'Related was successfully created.') }
        format.xml  { render :xml => @related, :status => :created, :location => @related }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @related.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relateds/1
  # PUT /relateds/1.xml
  def update
    @related = Related.find(params[:id])

    respond_to do |format|
      if @related.update_attributes(params[:related])
        format.html { redirect_to(@related, :notice => 'Related was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @related.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relateds/1
  # DELETE /relateds/1.xml
  def destroy
    @related = Related.find(params[:id])
    @related.destroy

    respond_to do |format|
      format.html { redirect_to(relateds_url) }
      format.xml  { head :ok }
    end
  end
end

class OriginlangsController < ApplicationController
  # GET /originlangs
  # GET /originlangs.xml
  def index
    @originlangs = Originlang.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @originlangs }
    end
  end

  # GET /originlangs/1
  # GET /originlangs/1.xml
  def show
    @originlang = Originlang.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @originlang }
    end
  end

  # GET /originlangs/new
  # GET /originlangs/new.xml
  def new
    @originlang = Originlang.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @originlang }
    end
  end

  # GET /originlangs/1/edit
  def edit
    @originlang = Originlang.find(params[:id])
  end

  # POST /originlangs
  # POST /originlangs.xml
  def create
    @originlang = Originlang.new(params[:originlang])

    respond_to do |format|
      if @originlang.save
        format.html { redirect_to(@originlang, :notice => 'Originlang was successfully created.') }
        format.xml  { render :xml => @originlang, :status => :created, :location => @originlang }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @originlang.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /originlangs/1
  # PUT /originlangs/1.xml
  def update
    @originlang = Originlang.find(params[:id])

    respond_to do |format|
      if @originlang.update_attributes(params[:originlang])
        format.html { redirect_to(@originlang, :notice => 'Originlang was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @originlang.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /originlangs/1
  # DELETE /originlangs/1.xml
  def destroy
    @originlang = Originlang.find(params[:id])
    @originlang.destroy

    respond_to do |format|
      format.html { redirect_to(originlangs_url) }
      format.xml  { head :ok }
    end
  end
end

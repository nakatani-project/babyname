class CelebsController < ApplicationController
  # GET /celebs
  # GET /celebs.xml
  def index
    @celebs = Celeb.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @celebs }
    end
  end

  # GET /celebs/1
  # GET /celebs/1.xml
  def show
    @celeb = Celeb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @celeb }
    end
  end

  # GET /celebs/new
  # GET /celebs/new.xml
  def new
    @celeb = Celeb.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @celeb }
    end
  end

  # GET /celebs/1/edit
  def edit
    @celeb = Celeb.find(params[:id])
  end

  # POST /celebs
  # POST /celebs.xml
  def create
    @celeb = Celeb.new(params[:celeb])

    respond_to do |format|
      if @celeb.save
        format.html { redirect_to(@celeb, :notice => 'Celeb was successfully created.') }
        format.xml  { render :xml => @celeb, :status => :created, :location => @celeb }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @celeb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /celebs/1
  # PUT /celebs/1.xml
  def update
    @celeb = Celeb.find(params[:id])

    respond_to do |format|
      if @celeb.update_attributes(params[:celeb])
        format.html { redirect_to(@celeb, :notice => 'Celeb was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @celeb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /celebs/1
  # DELETE /celebs/1.xml
  def destroy
    @celeb = Celeb.find(params[:id])
    @celeb.destroy

    respond_to do |format|
      format.html { redirect_to(celebs_url) }
      format.xml  { head :ok }
    end
  end
end

class BabiesController < ApplicationController
	
  layout 'application' 
  # GET /babies
  # GET /babies.xml
  
  def index
    @gender = params[:gender]
    
   	# search by gender
    if @gender != nil
    	@babies = Baby.where("gender = ?", @gender.capitalize).order("lang_count desc").paginate(:per_page => 10, :page => params[:page])
    	
    # search by region
    elsif !params[:reg_id].nil?
    	@gender = "other"
    	@babies = Region.find(params[:reg_id]).babies.order("lang_count desc").paginate(:per_page => 10, :page => params[:page])
    
    # search by language
    elsif !params[:lang_id].nil?
    	@gender = "other"
    	@babies = Language.find(params[:lang_id]).babies.order("lang_count desc").paginate(:per_page => 10, :page => params[:page])
    
    # search by keyword (name)
    elsif !params[:search].nil?
    	@gender = "other"
  		@babies = Baby.search(params[:search]).order("lang_count desc").paginate(:per_page => 10, :page => params[:page])
  		
  	# return all baby names
  	else
  		@gender = "other"
  		@babies = Baby.order("lang_count desc").paginate(:per_page => 10, :page => params[:page])
	end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @babies }
    end
  end

  # GET /babies/1
  # GET /babies/1.xml
  def show
    @baby = Baby.find(params[:id])
	@gender = @baby.gender.downcase
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @baby }
    end
  end

  # GET /babies/new
  # GET /babies/new.xml
  def new
    @baby = Baby.new
    @baby.babyregions.build
    #Making the 'Unisex' default.
    #When adding another language, application_helper will have to do the same job
    @baby.babylangs.build(:gender => 'Unisex')
    
    @back = request.env["HTTP_REFERER"]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @baby }
    end
  end

  # GET /babies/1/edit
  def edit
    @baby = Baby.find(params[:id])
  end

  # POST /babies
  # POST /babies.xml
  def create
    @baby = Baby.new(params[:baby])
    # TODO : Fix gender assignment
	@baby.gender = "Unisex" 
    respond_to do |format|
      if @baby.save
        format.html { redirect_to(@baby, :notice => 'Baby was successfully created.') }
        format.xml  { render :xml => @baby, :status => :created, :location => @baby }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @baby.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /babies/1
  # PUT /babies/1.xml
  def update
    @baby = Baby.find(params[:id])

    respond_to do |format|
      if @baby.update_attributes(params[:baby])
        format.html { redirect_to(@baby, :notice => 'Baby was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @baby.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /babies/1
  # DELETE /babies/1.xml
  def destroy
    @baby = Baby.find(params[:id])
    @baby.destroy

    respond_to do |format|
      format.html { redirect_to(babies_url) }
      format.xml  { head :ok }
    end
  end
  
end
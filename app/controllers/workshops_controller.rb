class WorkshopsController < ApplicationController
  # GET /workshops
  # GET /workshops.xml
  def index
    @workshops = Workshop.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workshops }
    end
  end

  # GET /workshops/1
  # GET /workshops/1.xml
  def show
    @workshop = Workshop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workshop }
    end
  end

  # GET /workshops/new
  # GET /workshops/new.xml
  def new
    @workshop = Workshop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workshop }
    end
  end

  # GET /workshops/1/edit
  def edit
    @workshop = Workshop.find(params[:id])
  end

  # POST /workshops
  # POST /workshops.xml
  def create
    @workshop = Workshop.new(params[:workshop])

    respond_to do |format|
      if @workshop.save
        flash[:notice] = 'Workshop was successfully created.'
        format.html { redirect_to(@workshop) }
        format.xml  { render :xml => @workshop, :status => :created, :location => @workshop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workshop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workshops/1
  # PUT /workshops/1.xml
  def update
    @workshop = Workshop.find(params[:id])

    respond_to do |format|
      if @workshop.update_attributes(params[:workshop])
        flash[:notice] = 'Workshop was successfully updated.'
        format.html { redirect_to(@workshop) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workshop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1
  # DELETE /workshops/1.xml
  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy
    @workshop_id = "workshop_#{@workshop.id}"
    
    respond_to do |format|
      format.html { redirect_to(workshops_url) }
      format.js 
      format.xml  { head :ok }
    end
  end
end

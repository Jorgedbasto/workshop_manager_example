class RegistrationsController < ApplicationController

  before_filter :load_workshop

  def index
    @registrations = @workshop.registrations

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
    end
  end

  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  def new
    @registration = Registration.new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  def edit
    @registration = Registration.find(params[:id])
    @user = User.new
  end

  def create
    @registration = Registration.new(params[:registration])
  
    @registration.user_id  = @registration.build_user(params[:user]) if @registration.user_id.nil?
    @workshop.registrations << @registration
    
    respond_to do |format|
      if @registration.save
        flash[:notice] = 'Registration was successfully created.'
        format.html { redirect_to workshop_registrations_path(@workshop) }
        format.xml  { render :xml => @registration, :status => :created, :location => @registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update  
    @registration = Registration.find(params[:id])

    @user = @registration.build_user(params[:user]) if @registration.user_id.nil?
    @workshop.registrations << @registration

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        flash[:notice] = 'Registration was successfully updated.'
        format.html { redirect_to workshop_registrations_path(@workshop)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @registration = @workshop.registrations.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to workshop_registrations_path(@workshop)  }
      format.xml  { head :ok }
    end
  end

  #DRY up the code by always loading workshop
  def load_workshop
    @workshop = Workshop.find(params[:workshop_id])
  end


end

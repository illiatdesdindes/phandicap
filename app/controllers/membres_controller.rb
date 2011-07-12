class MembresController < ApplicationController  
  # GET /membres
  # GET /membres.xml
  def index
    @membres = Membre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @membres }
    end
  end

  # GET /membres/1
  # GET /membres/1.xml
  def show
    @membre = Membre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @membre }
    end
  end

  # GET /membres/new
  # GET /membres/new.xml
  def new
    @membre = Membre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @membre }
    end
  end

  # GET /membres/1/edit
  def edit
    @membre = Membre.find(params[:id])
  end

  # POST /membres
  # POST /membres.xml
  def create
    @membre = Membre.new(params[:membre])
    
    first_membre_to_admin @membre 
       
    respond_to do |format|
      if @membre.save
        login @membre
        flash[:success] = 'L\'inscritpion est valid&eacute;'
        
        format.html { redirect_to new_candidature_path }
        #format.xml  { render :xml => @membre, :status => :created, :location => @membre }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @membre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /membres/1
  # PUT /membres/1.xml
  def update
    @membre = Membre.find(params[:id])

    respond_to do |format|
      if @membre.update_attributes(params[:membre])
        format.html { redirect_to(@membre, :notice => 'Membre was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @membre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /membres/1
  # DELETE /membres/1.xml
  def destroy
    @membre = Membre.find(params[:id])
    @membre.destroy

    respond_to do |format|
      format.html { redirect_to(membres_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def first_membre_to_admin membre
    if Membre.count == 0 #and membre.errors.nil?
      membre.admin = true
      flash[:info] = 'Vous etes admin'
    else
      membre.admin = false
    end
  end
  
end

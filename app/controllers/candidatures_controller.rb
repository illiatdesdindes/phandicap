class CandidaturesController < ApplicationController
  # GET /candidatures
  # GET /candidatures.xml
  
  before_filter :is_connected, :only => [:create, :new]
  before_filter :is_admin, :only => [:attente, :valide, :destroy, :update]
  
  def index
    @candidatures = Candidature.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @candidatures }
    end
  end

  # GET /candidatures/1
  # GET /candidatures/1.xml
  def show
    @candidature = Candidature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @candidature }
    end
  end

  # GET /candidatures/new
  # GET /candidatures/new.xml
  def new
    @candidature = Candidature.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @candidature }
    end
  end

  # GET /candidatures/1/edit
  def edit
    @candidature = Candidature.find(params[:id])
  end

  # POST /candidatures
  # POST /candidatures.xml
  def create
    @membre = current_membre    
    @candidature = @membre.candidatures.new(params[:candidature])
      
    respond_to do |format|
      if @candidature.save
        flash[:success] = 'Votre candidature est enregistr&eacute, nous vous contacterons pour vous confirmer la validit&eacute de l\'&eacute;venement'
        format.html { redirect_to(@candidature) }
        format.xml  { render :xml => @candidature, :status => :created, :location => @candidature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @candidature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /candidatures/1
  # PUT /candidatures/1.xml
  def update
    @candidature = Candidature.find(params[:id])

    respond_to do |format|
      if @candidature.update_attributes(params[:candidature])
        format.html { redirect_to(@candidature, :notice => 'Candidature was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @candidature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /candidatures/1
  # DELETE /candidatures/1.xml
  def destroy
    @candidature = Candidature.find(params[:id])
    @candidature.destroy

    respond_to do |format|
      format.html { redirect_to(candidatures_url) }
      format.xml  { head :ok }
    end
  end
  
  def valide
    @candidature = Candidature.find(params[:id])
    @candidature.statut = "Ok"
    @candidature.save
    flash[:success] = "Evenement valid&eacute"
    redirect_to candidatures_path
  end
  
  def attente
    @candidature = Candidature.find(params[:id])
    @candidature.statut = "En attente"
    @candidature.save
    flash[:notice] = "Evenement en attente"
    redirect_to candidatures_path
  end
  
  private
    def is_admin
      unless current_membre.admin?
        flash[:error] = "erreur"
        redirect_to candidatures_path
      end
    end
    
    def is_connected
      if current_membre.nil?
        flash[:notice] = 'Veuillez vous authentifier'
        redirect_to new_membre_path
      end
    end
end

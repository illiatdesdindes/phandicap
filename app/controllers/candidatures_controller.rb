class CandidaturesController < ApplicationController
  # GET /candidatures
  # GET /candidatures.xml
  
  before_filter :is_admin
  
  def index
    @candidatures = Candidature.all
  end

  # GET /candidatures/1
  # GET /candidatures/1.xml
  def show
    @candidature = Candidature.find(params[:id])
  end

  # GET /candidatures/new
  # GET /candidatures/new.xml
  def new
    @candidature = Candidature.new
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

    if @candidature.save
      flash[:success] = 'Votre candidature est enregistr&eacute, nous vous contacterons pour vous confirmer la validit&eacute de l\'&eacute;venement'
      redirect_to(@candidature)
    else
      render :action => "new"
    end
  end

  # PUT /candidatures/1
  # PUT /candidatures/1.xml
  def update
    @candidature = Candidature.find(params[:id])
    
    if @candidature.update_attributes(params[:candidature])
      redirect_to(@candidature, :notice => 'La candidature a &eacute;t&eacute; &eacutedit&eacute;.')
    else
      render :action => "edit"
    end
  end

  # DELETE /candidatures/1
  # DELETE /candidatures/1.xml
  def destroy
    @candidature = Candidature.find(params[:id])
    @candidature.destroy

    redirect_to(candidatures_url)
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
      if current_membre and !current_membre.admin?
        flash[:error] = "Vous n'etes pas administrateur"
        redirect_to notadmin_path
      end
    end
    
    def is_connected
      if current_membre.nil?
        flash[:notice] = 'Veuillez vous authentifier'
        redirect_to new_membre_path
      end
    end
end

class EvenementsController < ApplicationController

  def index
    @evenements = Evenement.all
    @regions = Region.all
    if @regions.nil?
      redirect_to pasderegion_path
    end
  end

  def show
    @evenement = Evenement.find(params[:id])

  end


  def new
    @evenement = Evenement.new
    @regions = Region.all
  end

  def edit
    @evenement = Evenement.find(params[:id])
  end

  def create    
    @region = Region.find(params[:region][:id])
    @evenement = @region.evenements.build(params[:evenement])
    @evenement.membre = current_membre

    if @evenement.save
      flash[:success] = 'Votre candidature est enregistr&eacute, nous vous contacterons pour vous confirmer la validit&eacute de l\'&eacute;venement'
      redirect_to(@evenement)
    else
      render :action => "new"
    end
  end

  def update
    @evenement = Evenement.find(params[:id])

    if @evenement.update_attributes(params[:evenement])
      redirect_to(@evenement, :notice => 'Evenement was successfully updated.')
    else
      format.html { render :action => "edit" }
    end
  end

  def destroy
    @evenement = Evenement.find(params[:id])
    @evenement.destroy

    respond_to do |format|
      format.html { redirect_to(evenements_url) }
      format.xml  { head :ok }
    end
  end
end

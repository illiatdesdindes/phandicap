class SessionsController < ApplicationController
  def new
    @membre = Membre.new
  end

  def create
    @membre = Membre.find_by_mail(params[:membre][:mail])
    
    if @membre
      login @membre
      flash[:success] = "Vous &ecirc;tes connect&eacute"
      redirect_to new_candidature_path
    else
      flash[:error] = "Vous avez fait une erreur"
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    redirect_to new_membre_path
  end

end

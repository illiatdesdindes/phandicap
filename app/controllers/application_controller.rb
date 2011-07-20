class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_membre
  
  def login membre
    session[:membre_id] = membre.id
  end
  
  def logout
    session[:membre_id] = nil
  end
  
  def current_membre
    Membre.find_by_id(session[:membre_id])
  end
  
end

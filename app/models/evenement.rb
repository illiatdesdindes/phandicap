class Evenement < ActiveRecord::Base
  belongs_to :membre
  #belongs_to :region
  
  attr_accessible :titre, :detail, :date, :adresse
  
  validates_presence_of :titre, :detail, :date, :adresse
  
  
  def valide?
    statut == 'Ok'
  end
  
  def attente?
    statut == 'En attente'
  end
  
  def nouveau?
    statut == 'nouveau'
  end
  
end

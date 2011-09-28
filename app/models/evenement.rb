class Evenement < ActiveRecord::Base
  belongs_to :membre
  belongs_to :region
  
  attr_accessible :titre, :description, :date, :adresse, :region_id, :membre_id
  
  validates_presence_of :titre, :description, :date, :adresse
  
  
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

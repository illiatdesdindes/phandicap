class Candidature < ActiveRecord::Base
  belongs_to :membre
  
  attr_accessible :evenement
  
  validates_presence_of :evenement
  
  scope :valide, where('statut = "Ok"')
  
  def valide?
    statut == 'Ok'
  end
  
  def attente?
    statut == 'En attente'
  end
  
  def nouvelle?
    statut == 'nouvelle'
  end
end

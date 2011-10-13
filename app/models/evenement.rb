class Evenement < ActiveRecord::Base
  belongs_to :membre
  belongs_to :region
  
  attr_accessible :titre, :description, :date, :adresse, :region_id, :membre_id, :statut
  
  validates_presence_of :titre, :description, :date, :adresse
  
  
  def ok?
    statut == 'ok'
  end
  
  def attente?
    statut == 'attente'
  end
  
  def nouveau?
    statut == 'nouveau'
  end
  
end

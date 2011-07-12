class Candidature < ActiveRecord::Base
  belongs_to :membre
  
  validates_presence_of :evenement
end

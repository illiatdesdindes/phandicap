class Membre < ActiveRecord::Base
  
  has_many :evenements, :dependent => :destroy
  
  attr_accessible :nom, :mail, :adresse, :telephone, :responsable
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :nom,  :presence => true,
                    :length   => { :maximum => 250 }
	validates :mail, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  validates_presence_of :adresse, :telephone

  
  def has_a_valid_candidature
    candidatures.where('candidatures.statut = "Ok"').count > 0 
  end
  
  def to_s
    nom
  end
end

class Region < ActiveRecord::Base
  has_many :evenements
  
  def to_label  # or to_s for select option in active admin to display the right 
    nom         # labels not hash value of ruby object
  end
  
end

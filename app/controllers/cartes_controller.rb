class CartesController < ApplicationController
  
  def index
    unless current_membre and ( current_membre.candidatures.where('candidatures.statut = "Ok"').count > 0 or current_membre.admin? ) then
      redirect_to "http://printemps-handicap.org"
    end  
  end

  def show
  
  end
  
  
  private
  
    def putNameOnImage name
      carte = ImageList.new('../../public/images/carte.jpg')
      text = Draw.new
      #text.font_family = 'helvetica'
      text.pointsize = 18
      text.annotate( carte, 0,0,20,30, name) {
        self.fill = '#0848ac'
        }
      carte.write('../../public/images/cartename.jpg')
    end

end

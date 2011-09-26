class CartesController < ApplicationController
  require 'RMagick'
  def index
    unless current_membre and ( current_membre.has_a_valid_candidature or current_membre.admin? ) then
      redirect_to "http://printemps-handicap.org"
    end  
  end

  def show
    putNameOnImage params[:nom]
  end
  
  
  private
  
    def putNameOnImage name
      carte = Magick::ImageList.new('public/images/carte.jpg')
      text = Magick::Draw.new
      #text.font_family = 'helvetica'
      text.pointsize = 18
      text.annotate( carte, 0,0,20,30, name) {
        self.fill = '#0848ac'
        }
      carte.write('public/images/cartename.jpg')
    end

end

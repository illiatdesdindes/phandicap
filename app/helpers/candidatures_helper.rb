module CandidaturesHelper
  def bg_status_color candidature
    if candidature.valide?
      "valide_candidature"
    elsif candidature.attente?
      "attente_candidature"
    elsif candidature.nouvelle?
      "nouvelle_candidature"
    end
  end 
end

ActiveAdmin.register Evenement do
  index do
    column :titre
    column :description
    column :statut , :sortable => :statut do |evt|
      div :class => (evt.statut + '_evenement statut_evenement') do
        evt.statut
      end
      div do
        link_to( image_tag('ok.png', :size => "20x20"), statut_admin_evenement_path(evt, :statut => 'ok')) +
        '' +
        link_to( image_tag('attente.png', :size => "20x20"), statut_admin_evenement_path(evt, :statut => 'attente'))
      end
    end
    column :date
    column :region_id do |evenement|
      evenement.region.to_s
    end
    column :actions do |evt|
        link_to( 'Voir', admin_evenement_path(evt)) + 
        ' ' + 
        link_to( 'Editer', edit_admin_evenement_path(evt)) +
        ' ' +
        link_to( 'Supprimer', admin_evenement_path(evt), :method => :delete, :confirm => 'Attention vous allez supprimer un evenement')
    end
    #default_actions
  end
  
  member_action :statut, :method => :get do
    evt = Evenement.find(params[:id])
    evt.statut = params[:statut]
    evt.save
    redirect_to :back
  end
  
  
end

ActiveAdmin.register Evenement do
  index do
    column :titre
    column :description
    column :statut do |evt|
      div :class => (evt.statut + '_evenement statut_evenement') do
        evt.statut
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
end

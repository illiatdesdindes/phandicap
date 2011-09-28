ActiveAdmin.register Evenement do
  index do
    column :titre
    column :description
    column :statut
    column :date
    column :region_id do |evenement|
      evenement.region.nom
    end
    default_actions
  end
end

ActiveAdmin.register About do
  permit_params :cities_covered, :happy_customers, :hero_subtitle, :hero_title, :mission_description, :mission_title, :properties_listed, :values_offer, :values_why, :vision_description, :vision_title, :years_experience

  index do
    selectable_column
    id_column
    column :hero_title
    column :cities_covered
    column :happy_customers
    column :properties_listed
    actions
  end

  filter :hero_title
end

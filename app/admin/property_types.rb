ActiveAdmin.register PropertyType do
  permit_params :name, :property_category_id

  index do
    selectable_column
    id_column
    column :name
    column :property_category
    column :created_at
    actions
  end

  filter :name
  filter :property_category
end

ActiveAdmin.register Property do
  permit_params :area_sqft, :bathrooms, :bedrooms, :city, :description, :furnished, :location, :price, :property_category, :property_category_id, :property_type, :property_type_id, :published, :sale_status, :slug, :state, :status, :title, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :price
    column :city
    column :status
    column :published
    column :user
    actions
  end

  filter :title
  filter :city
  filter :price
  filter :status
  filter :user
end

ActiveAdmin.register Blog do
  permit_params :blog_category_id, :city, :content, :published_at, :state, :status, :title, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :status
    column :published_at
    column :user
    actions
  end

  filter :title
  filter :status
  filter :user
end

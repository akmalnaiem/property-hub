ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :phone_number, :role

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone_number
    column :role
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :role, as: :select, collection: User.roles
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone_number
      f.input :role, as: :select, collection: User.roles.keys
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

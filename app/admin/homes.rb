ActiveAdmin.register Home do
  permit_params :hero_badge_text, :hero_subtitle, :hero_title, :why_choose

  index do
    selectable_column
    id_column
    column :hero_title
    column :hero_badge_text
    actions
  end

  filter :hero_title
end

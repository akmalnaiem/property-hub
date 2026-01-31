class CreateHomes < ActiveRecord::Migration[8.1]
  def change
    create_table :homes do |t|
      t.string :hero_title
      t.text :hero_subtitle
      t.string :hero_badge_text
      t.text :why_choose

      t.timestamps
    end
  end
end

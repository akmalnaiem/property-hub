class CreateAbouts < ActiveRecord::Migration[8.1]
  def change
    create_table :abouts do |t|
      t.string :hero_title
      t.text :hero_subtitle
      t.integer :properties_listed
      t.integer :happy_customers
      t.integer :cities_covered
      t.integer :years_experience
      t.string :mission_title
      t.text :mission_description
      t.string :vision_title
      t.text :vision_description
      t.text :values_offer
      t.text :values_why

      t.timestamps
    end
  end
end

class CreateProperties < ActiveRecord::Migration[8.1]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :property_type
      t.integer :status
      t.decimal :price
      t.integer :area_sqft
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :furnished
      t.boolean :published
      t.string :slug

      t.timestamps
    end
  end
end

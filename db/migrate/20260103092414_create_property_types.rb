class CreatePropertyTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :property_types do |t|
      t.string :name
      t.references :property_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

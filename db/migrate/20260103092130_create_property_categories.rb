class CreatePropertyCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :property_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end

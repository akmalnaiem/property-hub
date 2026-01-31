class AddPropertyCategoryToProperties < ActiveRecord::Migration[8.1]
  def change
    add_reference :properties, :property_category, null: false, foreign_key: true
  end
end

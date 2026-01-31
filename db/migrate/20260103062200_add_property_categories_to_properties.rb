class AddPropertyCategoriesToProperties < ActiveRecord::Migration[8.1]
  def change
    add_column :properties, :property_category, :string
  end
end

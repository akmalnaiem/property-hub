class AddUniqueIndexToPropertiesSlug < ActiveRecord::Migration[8.1]
  def change
   add_index :properties, :slug, unique: true
  end
end

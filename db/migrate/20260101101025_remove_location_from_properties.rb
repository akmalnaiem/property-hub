class RemoveLocationFromProperties < ActiveRecord::Migration[8.1]
  def change
    remove_column :properties, :location, :string
  end
end

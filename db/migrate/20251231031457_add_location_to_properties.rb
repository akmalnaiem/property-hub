class AddLocationToProperties < ActiveRecord::Migration[8.1]
  def change
    add_column :properties, :location, :string
  end
end

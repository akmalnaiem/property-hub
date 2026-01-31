class AddStateCityLocationColumnToProperties < ActiveRecord::Migration[8.1]
  def change
    add_column :properties, :state, :string
    add_column :properties, :city, :string
    add_column :properties, :location, :string
  end
end

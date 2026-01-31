class AddSaleStatusToProperties < ActiveRecord::Migration[8.1]
  def change
    add_column :properties, :sale_status, :integer
  end
end

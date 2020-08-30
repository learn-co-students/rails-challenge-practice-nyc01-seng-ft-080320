class AddColumnToOffices < ActiveRecord::Migration[5.1]
  def change
    add_column :offices, :building_id, :integer
    add_column :offices, :company_id, :integer
    add_column :offices, :floor, :integer
  end
end

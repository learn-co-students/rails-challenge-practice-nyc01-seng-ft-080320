class AddColumnsToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :name, :string
    add_column :buildings, :country, :string
    add_column :buildings, :address, :string
    add_column :buildings, :rent_per_floor, :integer
    add_column :buildings, :number_of_floors, :integer
  end
end

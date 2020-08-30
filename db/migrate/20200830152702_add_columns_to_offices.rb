class AddColumnsToOffices < ActiveRecord::Migration[5.1]
  def change
    add_reference :offices, :building, foreign_key: true
    add_reference :offices, :company, foreign_key: true
    add_column :offices, :floor, :integer
  end
end

class Office < ApplicationRecord
    belongs_to :building
    belongs_to :company
    has_many :employees, through: :company
    validates :floor, uniqueness: { scope: :building_id, message: "Floor is rented" }
    validates :floor, numericality: true
end

class Office < ApplicationRecord
    belongs_to :building
    belongs_to :company

    validates :office_floor, numericality: { only_integer: true }
end

class Office < ApplicationRecord
    belongs_to :building
    belongs_to :company


    def location
        "#{self.building.name}, floor #{self.floor}"
    end
end

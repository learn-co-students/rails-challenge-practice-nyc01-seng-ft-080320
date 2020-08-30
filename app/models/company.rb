class Company < ApplicationRecord
    has_many :employees
    has_many :offices
    accepts_nested_attributes_for :offices
    validates :name, presence: true

    def rent
        self.offices.sum {|office| office.building.rent_per_floor}
    end

    

    def offices_attributes=(office_hash)
        office_hash.values.each do |building|
            current_building = Building.find(building[:id])
            building[:offices].each do |office|
                if office != ""
                    latest = self.offices.build(building: current_building, company: self, floor: office.to_i)
                end
            end
        end
    end
end

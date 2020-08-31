class Company < ApplicationRecord
    has_many :employees 
    has_many :offices 
    has_many :buildings, through: :offices 




    def rent
        self.buildings.map{|building| building.rent_per_floor}.sum 
    end


end

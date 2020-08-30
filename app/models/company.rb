class Company < ApplicationRecord
    has_many :employees 
    has_many :offices 
    has_many :buildings, through: :offices 

def location 
    self.offices.map do |office|
        "#{office.building.name}, floor #{office.floor}"
    end
end

end

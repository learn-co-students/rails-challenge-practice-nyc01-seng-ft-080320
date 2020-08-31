class Building < ApplicationRecord
    has_many :offices
    has_many :companies, through: :offices 
    has_many :employees, through: :companies 
  
  def number_of_floors_available
    
    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

    # def available_offices
    #   @building.empty_offices.each{|office| office.floor} 
    # end

  def total_rent
     rented = self.companies.count 
     self.rent_per_floor * rented
  end


end

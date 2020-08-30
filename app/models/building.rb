class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices
  has_many :employees, through: :companies
  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def occupied_floors
    number_of_floors - empty_offices.count
  end

  def income
    occupied_floors * self.rent_per_floor
  end

end

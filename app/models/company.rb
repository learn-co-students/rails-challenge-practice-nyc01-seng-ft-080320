class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees

    validates :name, presence: true
    accepts_nested_attributes_for :offices
    #accepts_nested_attributes_for :employees

    def total_rent_paid
        self.offices.map{|o|o.building.rent_per_floor}.sum
    end

end


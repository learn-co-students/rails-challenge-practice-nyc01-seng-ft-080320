class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees

    validates :name, presence: true
    validates :name, length: {minimum: 5}
end

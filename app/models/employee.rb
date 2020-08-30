class Employee < ApplicationRecord
    belongs_to :company
    has_many :offices, through: :company
end

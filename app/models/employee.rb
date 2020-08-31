class Employee < ApplicationRecord
    belongs_to :company
    has_many :offices, through: :company

    validates :name, :title, presence: true
    validates :name, length: {minimum: 6}

end

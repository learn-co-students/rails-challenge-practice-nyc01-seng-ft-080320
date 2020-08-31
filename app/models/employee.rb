class Employee < ApplicationRecord
    belongs_to :company

    validates :name, :title, :company, presence: true  
end

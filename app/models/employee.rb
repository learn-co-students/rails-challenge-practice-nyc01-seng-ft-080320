class Employee < ApplicationRecord
    belongs_to :company
    validates :name, :title, :company, presence: true
    # not validating length... 4 characters... My name deserves to be listed
    #validates :name, length: { minimum: 5 }
end

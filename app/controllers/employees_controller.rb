class CompaniesController < ApplicationController

    def destroy
        Employee.find(params[:id]).destroy
    end
    
end
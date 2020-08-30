class OfficesController < ApplicationController
    before_action :find_office, only: [:show]
    
    def show

    end

    def index
        @offices = Office.all
    end


    private

    def find_office
        @office = Office.find(params[:id])
    end
end
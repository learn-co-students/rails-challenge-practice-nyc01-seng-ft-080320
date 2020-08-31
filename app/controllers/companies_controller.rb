class CompaniesController < ApplicationController
   
    def new
        @company = Company.new
        @company.employees.build
    end

    def show
        @company = Company.find(params[:id])
        #@company.employees.build
    end

    def create
        #raise params.inspect
        @company = Company.create(company_params)
        #raise params.inspect
        if @company.valid?
            redirect_to company_path(@company)
        else
            render :new
        end
    end

    def edit
        @company = Company.find(params[:id])
        # @company.employees.build
    end 

    def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
            redirect_to company_path(@company)
        else
            render :edit
        end
    end

    private
    
    def company_params
        params.require(:company).permit(:name, :offices_attributes, employees_attributes:[:name, :title, :company_id])
    end
    # offices_attributes: [:building_id, :company_id, :floor]
end
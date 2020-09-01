class CompaniesController < ApplicationController
   
    def new
        @company = Company.new
        #@company.employees.build
    end

    def show
        @company = Company.find(params[:id])
        @employee = Employee.new
    end

    def create
        #raise params.inspect
        
        @company = Company.create(company_params)
        #byebug
        #raise params.inspect
        if @company.valid?
            byebug
            params[:company][:offices_attributes].each do |key, office_att|
                office_att["offices"].each do |office|
                    if office != ""
                        Office.create(company: @company, building_id: office_att["id"], floor: office)
                    end
                end
            end
            byebug
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
        params.require(:company).permit(:name)
    end
    # , employees_attributes:[:name, :title, :company_id]
    # offices_attributes: [:building_id, :company_id, :floor]
end
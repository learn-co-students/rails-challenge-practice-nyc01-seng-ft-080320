class CompaniesController < ApplicationController
    before_action :find_company, only: [:show, :edit, :update, :destroy]
    before_action :new_company, only: [:new, :create]
    
    def index
        @companies = Company.all
    end

    def show
        
    end

    def edit
        
    end

    def new

    end

    def create
        @new_company = Company.create(company_params)
        if @new_company.valid?
            redirect_to company_path(@new_company)
        else
            flash[:errors] = @new_company.errors.full_messages
            redirect_to new_company_path
        end
    end

    private

    def company_params
        params.require(:company).permit(:name, :offices_attributes => [:id, offices:[]]) 
    end

    def find_company
        @company = Company.find(params[:id])
    end

    def new_company
        @company = Company.new
    end
end
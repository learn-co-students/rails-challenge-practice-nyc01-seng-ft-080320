class CompaniesController < ApplicationController
    before_action :find_company, only: [:show, :edit, :update, :destroy]

    def index
        @companies = Company.all
    end

    def show
    end

    def new
        @company = Company.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def find_company
        @company = Company.find(params[:id])
    end

    def company_params
        params.require(:company).permit(:name)
    end
end
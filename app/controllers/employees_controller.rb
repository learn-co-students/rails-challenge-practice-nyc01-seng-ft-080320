class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :destroy]

    def index
        @employees = Employee.all
    end

    def show
    end

    def destroy
        @employee.destroy
        redirect_to company_path(@employee.company)
    end

    private

    def find_employee
        @employee = Employee.find(params[:id])
    end
end
class EmployeesController < ApplicationController
    def new
        @employee = Employee.new
    end

    def create 
        @employee = Employee.create(employee_params)
        if @employee.valid?
        redirect_to companies_path(@employee.company)
        else flash[:my_errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to company_path(@employee.company)
    end

        private

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end
end

class EmployeesController < ApplicationController
    def new
        @employee = Employee.new
    end

    def show

    end

    def create
        @employee = Employee.create(employee_params)
        #raise params.inspect
        if @employee.valid?
            redirect_to companies_path
        else 
            render :new
        end
    end

    def edit 
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        if @employee.create(employee_params)
            redirect_to employee_path(@employee)
        else
            render :edit
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @company = @employee.company
        @employee.destroy
        redirect_to company_path(@company)
    end

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end

end
class EmployeesController < ApplicationController
    before_action :new_employee, only: [:new, :create]
    before_action :find_employee, only: [:edit, :destroy, :update, :show]
    
    def show
    end

    def index
        @employees = Employee.all.order(:name)
    end
    def new
        if params[:employee]
            current_company = Company.find(params[:employee][:company])
            @employee.company = current_company
            
        end
        
    end

    def destroy
        @employee.destroy
        redirect_to employees_path
    end

    def create
        @employee.update(employee_params)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            flash[:errors]= @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :company_id, :title)
    end

    def new_employee
        @employee = Employee.new
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end

end
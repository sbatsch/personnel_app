class Api::EmployeesController < ApplicationController

  def index
    full_time = params[:full_time]

    @employees = Employee.all
    
    if full_time
      @employees = Employee.full_time_employees
    end 

    render 'index.json.jb'
  end

  def create
    @employee = Employee.new( department_id: params[:department_id],
                              name: params[:name], 
                              salary: params[:salary], 
                              email: params[:email],
                              title: params[:title],
                              full_time: params[:full_time]
                            )
    if @employee.save
      render 'show.json.jb'
    else
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  def show 
    @employee = Employee.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @employee = Employee.find(params[:id])

    @employee.department_id = params[:department_id] || @employee.department_id
    @employee.name = params[:name] || @employee.name
    @employee.salary = params[:salary] || @employee.salary
    @employee.email  = params[:email ] || @employee.email
    @employee.title  = params[:title ] || @employee.title
    @employee.full_time  = params[:full_time ] || @employee.full_time

    if @employee.save
      render 'show.json.jb'
    else 
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    render json: { message: "I know this is harsh, but you've been terminated..." }
  end
end 

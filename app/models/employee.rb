class Employee < ApplicationRecord
  belongs_to :department

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :salary, numericality: { greater_than: 0, less_than: 10_000_000_000 }

  def increase_salary 
    self.salary = salary * 1.05
  end

  def self.full_time_employees
    where(full_time: true)       
  end
end

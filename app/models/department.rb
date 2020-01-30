class Department < ApplicationRecord
  has_many :employees 

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone, presence: true 
end

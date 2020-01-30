class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.integer :department_id
      t.string :name
      t.decimal :salary, precision: 12, scale: 2
      t.string :email
      t.string :title
      t.boolean :full_time

      t.timestamps
    end
  end
end

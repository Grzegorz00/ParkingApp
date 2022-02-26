class RemoveLastNameFromEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :last_name, :string
  end
end

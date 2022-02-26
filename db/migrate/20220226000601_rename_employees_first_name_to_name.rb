class RenameEmployeesFirstNameToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :employees, :first_name, :name
  end
end

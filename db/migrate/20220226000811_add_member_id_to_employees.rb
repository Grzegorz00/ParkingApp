class AddMemberIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :member_id, :string
  end
end

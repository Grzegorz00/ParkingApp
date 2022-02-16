class AddEmployeeToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :employee
  end
end

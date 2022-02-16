class AddForeignKeyToBooking < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :bookings, :employees
  end
end

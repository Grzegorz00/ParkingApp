class Employee < ApplicationRecord
    has_many :bookings, dependent: :destroy
end

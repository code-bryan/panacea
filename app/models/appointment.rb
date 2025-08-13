class Appointment < ApplicationRecord
  belongs_to :company
  belongs_to :patient
  belongs_to :dentist
end

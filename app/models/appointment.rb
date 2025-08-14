class Appointment < ApplicationRecord
  belongs_to :company
  belongs_to :patient
  belongs_to :dentist, class_name: "User"

  enum :status, [ :scheduled, :completed, :canceled, :no_show ]
end

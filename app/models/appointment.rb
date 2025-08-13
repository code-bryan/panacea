class Appointment < ApplicationRecord
  belongs_to :company
  belongs_to :patient
  belongs_to :dentist, class_name: "User"

  enum status: { scheduled: 0, completed: 1, canceled: 2, no_show: 3 }
end

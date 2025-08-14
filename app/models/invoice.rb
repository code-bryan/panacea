class Invoice < ApplicationRecord
  belongs_to :patient
  belongs_to :company
end

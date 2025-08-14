class Patient < ApplicationRecord
  belongs_to :company

  has_many :appointments, dependent: :destroy
  has_many :invoices
end

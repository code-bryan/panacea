class Patient < ApplicationRecord
  extend Nameable

  belongs_to :company

  has_many :appointments, dependent: :destroy
  has_many :invoices
end

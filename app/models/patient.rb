class Patient < ApplicationRecord
  include Nameable

  belongs_to :company

  has_many :appointments, dependent: :destroy
  has_many :invoices
end

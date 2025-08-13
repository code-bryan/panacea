class User < ApplicationRecord
  belongs_to :company

  has_many :appointments
end

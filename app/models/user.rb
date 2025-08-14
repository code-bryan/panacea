class User < ApplicationRecord
  belongs_to :company

  has_many :abilities, dependent: :destroy
  has_many :appointments, foreign_key: "dentist_id", dependent: :nullify
end

class User < ApplicationRecord
  extend Nameable

  has_secure_password

  belongs_to :company

  has_many :abilities, dependent: :destroy
  has_many :appointments, foreign_key: "dentist_id", dependent: :nullify

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end

class User < ApplicationRecord
  belongs_to :company

  has_many :appointments, foreign_key: "dentist_id"
end

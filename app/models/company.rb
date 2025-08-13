class Company < ApplicationRecord
  has_many :patients
  has_many :users
end

class Doctor < ApplicationRecord
  has_many :apointments
  has_many :patients, through: :apointments
  belongs_to :city
end

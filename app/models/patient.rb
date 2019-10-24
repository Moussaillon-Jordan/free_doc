class Patient < ApplicationRecord
  has_many :apointments
  has_many :doctors, through: :apointments
  belongs_to :city
end

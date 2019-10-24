# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Doctor.destroy_all
Patient.destroy_all
Apointment.destroy_all
City.destroy_all

8.times do
  city = City.create!(name: Faker::Address.city)
end

6.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, speciality: ["Dentist", "Ophtalmologist", "Generalist", "Surgeon"].sample, zip_code: Faker::Address.zip, city: City.all.sample) # Ajoute des docteurs à la BDD Doctor
end

8.times do
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
end #Ajoute des patients à la BDD Patient

5.times do
  apointment = Apointment.create!(date: Faker::Date.between(from: 2.years.ago, to: Date.today), doctor: Doctor.all.sample, patient: Patient.all.sample, city: City.all.sample) #Créer de rdv entre 1 docteur de la BDD Doctor et un patient de la BDD Patient, tirés au hasard
end

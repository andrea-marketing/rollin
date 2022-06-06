# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Vehicle.destroy_all

require 'faker'

category = ['bike', 'skate', 'rolling-skates', 'ice-skates', 'scooter']

  # 5.times do
  #   user = User.create!(email: "Faker::Internet.email", password: "rollin2022", password_confirmation: "rollin2022", first_name: "Faker::Name.first_name", last_name: "Faker::Name.last_name")
  # end

user = User.create!(email: "a.albrespy@gmail.com", password: "rollin2022", password_confirmation: "rollin2022", first_name: "Adele", last_name: "Albrespy")

10.times do
      vehicle = Vehicle.new(vehicle_type: category.sample, description: Faker::Lorem.sentence, address: Faker::Address.city, price: Faker::Number.between(from: 10, to: 100))
      vehicle.user = user
      vehicle.save!
    end

# User.create(email: "a.albrespy@gmail.com", password: "rollin2022", password_confirmation: "rollin2022", first_name: "Adele", last_name: "Albrespy")
# User.create(email: "andrea@gmail.com", password: "wagon2022", password_confirmation: "wagon2022", first_name: "Andrea", last_name: "Blabla")

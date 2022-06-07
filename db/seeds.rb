# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vehicle.destroy_all
User.destroy_all

require "open-uri"
require 'faker'

# category = ['bike', 'skate', 'rolling-skates', 'ice-skates', 'scooter']

file_bike_blue = URI.open('https://res.cloudinary.com/drnoyqnck/image/upload/v1654598661/development/xednhvyi55gzcraeuj5q1mz0bait.jpg')
file_skate_green = URI.open('https://res.cloudinary.com/drnoyqnck/image/upload/v1654604694/development/skate-green_mg75uz.jpg')
file_rolling_skate = URI.open('https://res.cloudinary.com/drnoyqnck/image/upload/v1654604380/development/s-l500_o8drvw.jpg')
file_ice_skate = URI.open('https://res.cloudinary.com/drnoyqnck/image/upload/v1654604379/development/patins_bo3xv0.jpg')

user1 = User.create!(email: "adele@gmail.com", password: "rollin2022", password_confirmation: "rollin2022", first_name: "Adele", last_name: "Rollin")
user2 = User.create!(email: "andrea@gmail.com", password: "wagon2022", password_confirmation: "wagon2022", first_name: "Andrea", last_name: "Blabla")

bike_blue = Vehicle.new(vehicle_type: 'bike', description: 'vélo bleu de ville', address: 'Marseille', price: 50, name: 'Vélo bleu')
bike_blue.photo.attach(io: file_bike_blue, filename: 'nes.png', content_type: 'image/jpg')
bike_blue.user = user1
bike_blue.save!

skate_green = Vehicle.new(vehicle_type: 'skate', description: 'skate vert neuf', address: 'Paris', price: 30, name: 'Skate neuf')
skate_green.photo.attach(io: file_skate_green, filename: 'nes.png', content_type: 'image/jpg')
skate_green.user = user1
skate_green.save!

rolling_skate = Vehicle.new(vehicle_type: 'rolling-skates', description: 'rollers jaunes', address: 'Marseille', price: 20, name: 'Rollers jaunes')
rolling_skate.photo.attach(io: file_rolling_skate, filename: 'nes.png', content_type: 'image/jpg')
rolling_skate.user = user2
rolling_skate.save!

ice_skate = Vehicle.new(vehicle_type: 'ice-skates', description: 'Patins à glace', address: 'Alpes', price: 30, name: 'patins à glace')
ice_skate.photo.attach(io: file_ice_skate, filename: 'nes.png', content_type: 'image/jpg')
ice_skate.user = user1
ice_skate.save!

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Vehicle.destroy_all

require "open-uri"
require 'faker'

category = ['bike', 'skate', 'rolling-skates', 'ice-skates', 'scooter']

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
article = Article.new(title: 'NES', body: "A great console")
article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

user1 = User.create!(email: "adele@gmail.com", password: "rollin2022", password_confirmation: "rollin2022", first_name: "Adele", last_name: "Rollin")
user2 = User.create!(email: "andrea@gmail.com", password: "wagon2022", password_confirmation: "wagon2022", first_name: "Andrea", last_name: "Blabla")

vehicle = Vehicle.new(vehicle_type: 'bike', description: 'vélo bleu de ville', address: Marseille, price: 50, photo: )
vehicle.user = user1
vehicle.save!

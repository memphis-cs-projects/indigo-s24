# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users

user1 = User.create!(
  email:    'alice@email.com',
  password: 'password'
)

user2 = User.create!(
  email:    'bob@email.com',
  password: 'password'
)

#Caravans

#Caravan1
caravan1 = Caravan.create!(
  name: 'Caravan1',
  size: 'compact',
  adventure: 'Mountains',
  exterior_color: 'Sandy Taupe',
  interior_theme: 'Modern minimalist',
  price: 19999

)

#Caravan2
caravan1 = Caravan.create!(
  name: 'Caravan2',
  size: 'Large',
  adventure: 'Beach',
  exterior_color: 'Ocean blue',
  interior_theme: 'Rustic charm',
  price: 25899

)

#Caravan3
caravan1 = Caravan.create!(
  name: 'Caravan3',
  size: 'Medium',
  adventure: 'Forest',
  exterior_color: 'Sunset orange',
  interior_theme: 'Tech charm',
  price: 30899

)

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
#caravan1.image.attach(io: File.open(Rails.root.join('/home/kavya/workspace/kavya-project/app/assets/images/Mountain.png')), filename: 'Mountain.jpg')

#Caravan2
caravan1 = Caravan.create!(
  name: 'Caravan2',
  size: 'Large',
  adventure: 'Beach',
  exterior_color: 'Ocean blue',
  interior_theme: 'Rustic charm',
  price: 25899

)
#caravan1.image.attach(io: File.open(Rails.root.join('/home/kavya/workspace/kavya-project/app/assets/images/Ocean.png')), filename: 'Ocean.jpg')

#Caravan3
caravan1 = Caravan.create!(
  name: 'Caravan3',
  size: 'Medium',
  adventure: 'Forest',
  exterior_color: 'Sunset orange',
  interior_theme: 'Tech charm',
  price: 30899

)

#caravan1.image.attach(io: File.open(Rails.root.join('/home/kavya/workspace/kavya-project/app/assets/images/Forest.png')), filename: 'Forest.jpg')

caravan_image_filenames = [
  'Mountain.png', 'Ocean.png', 'Forest.png'
]

Caravan.all.each_with_index do |caravan, index|
  image_filename = caravan_image_filenames[index % caravan_image_filenames.size]
  caravan.image.attach(io: File.open(Rails.root.join("app/assets/images/#{image_filename}")), filename: image_filename)
end

# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users



User.create!(email: 'admin@email.com', password: 'admin123')

User.create!(email: 'bob@email.com', password: 'password')

User.create!(email: 'alice@email.com', password: 'password')
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
caravan2 = Caravan.create!(
  name: 'Caravan2',
  size: 'Large',
  adventure: 'Beach',
  exterior_color: 'Ocean blue',
  interior_theme: 'Rustic charm',
  price: 25899

)
#caravan1.image.attach(io: File.open(Rails.root.join('/home/kavya/workspace/kavya-project/app/assets/images/Ocean.png')), filename: 'Ocean.jpg')

#Caravan3
caravan3 = Caravan.create!(
  name: 'Caravan3',
  size: 'Medium',
  adventure: 'Forest',
  exterior_color: 'Sunset orange',
  interior_theme: 'Tech charm',
  price: 30899

)

#caravan4
caravan4 = Caravan.create!(
  name: 'Ocean Breeze',
  size: 'compact',
  adventure: 'Beach',
  exterior_color: 'Seafoam green',
  interior_theme: 'Coastal serenity',
  price: 28456

)

#caravan5
caravan5 = Caravan.create!(
  name: 'Sylvan Wanderer',
  size: 'Large',
  adventure: 'Forest',
  exterior_color: 'Slay White',
  interior_theme: 'Earthy tones',
  price: 37564

)

#caravan6
caravan6 = Caravan.create!(
  name: 'Ridge Runner',
  size: 'small',
  adventure: 'Forest',
  exterior_color: 'Mountain Green',
  interior_theme: 'Tech charm',
  price: 31567

)

#caravan7
#caravan1 = Caravan.create!(

#caravan1.image.attach(io: File.open(Rails.root.join('/home/kavya/workspace/kavya-project/app/assets/images/Forest.png')), filename: 'Forest.jpg')
require 'image_processing/mini_magick'

caravan_image_filenames = [
  'Mountain.png', 'Ocean.png', 'Forest.png', 'caravan4.png' , 'caravan5.png', 'caravan6.png'
]

Caravan.all.each_with_index do |caravan, index|
  begin
    image_filename = caravan_image_filenames[index % caravan_image_filenames.size]
    image_path = Rails.root.join("app/assets/images/#{image_filename}")

    File.open(image_path) do |file|
      processed_image = ImageProcessing::MiniMagick
        .source(file)
        .resize_to_fill(800, 800)
        .call

      File.open(processed_image.path) do |processed_file|
        caravan.image.attach(io: processed_file, filename: image_filename)
      end

      FileUtils.rm(processed_image.path)
    end
  rescue => e
    puts "Failed to process image for #{caravan.name}: #{e.message}"
  end
end

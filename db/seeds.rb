# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  name = Faker::Restaurant.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.cell_phone_with_country_code
  category = %w[chinese italian japanese french belgian].sample

  new_restaurant = Restaurant.new(name: name, address: address, phone_number: phone_number, category: category)
  new_restaurant.save

  5.times do
    content = Faker::Restaurant.review
    rating = [0, 1, 2, 3, 4, 5].sample
    Review.create(content: content, rating: rating, restaurant: new_restaurant)
  end
end

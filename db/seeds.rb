# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all

10.times do
  r = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample)
  r.save
  id = r.id
  2.times do
    re = Review.new(content: Faker::Lorem.sentence, restaurant_id: id, rating: (0..5).to_a.sample)
    re.save
  end
end

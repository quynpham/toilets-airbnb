# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Toilet.destroy_all
User.destroy_all

puts "Creating toilets..."
user1 = User.create!({ email: "Quynh-Anh@lewagon.be", password: "toiletsairbnb"})
toilet1 = { name: "My Toilet", description: "very nice toilet!", location: "my house", price: 7.5, user: user1 }
toilet2 = { name: "Your toilet", description: "also nice!", location: "56A Shoreditch High St, London E1 6PQ", price: 4, user: user1 }

[ toilet1, toilet2 ].each do |attributes|
  toilet = Toilet.create!(attributes)
  puts "Created #{toilet.name}"
end
puts "Finished!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Booking.destroy_all
Toilet.destroy_all
User.destroy_all


puts "Creating toilets..."
user1 = User.create!({ email: "Quynh-Anh@lewagon.be", password: "toiletsairbnb"})
user2 = User.create!({ email: "kato@lewagon.be", password: "toiletsairbnb" })
user3 = User.create!({ email: "dorian@lewagon.be", password: "toiletsairbnb"})
toilet1 = { name: "Kato's toilet", description: "Very nice toilet with a view over Brussels!", location: "Cantersteen 12, 1000 Bruxelles", price: 7.5, user: user2 }
toilet2 = { name: "Quynh-Anh's toilet", description: "Also a nice toilet, with heated seating.", location: "Rue du MArché aux Herbes 56, 1000 Bruxelles", price: 4, user: user1 }
toilet3 = {name: "Dorian's toilet", description: "The best toilet you will ever use.", location: "Chaussée d'Alsemberg 252, 1190 Forest", price: 4, user: user3 }
[toilet1, toilet2, toilet3].each do |attributes|
  toilet = Toilet.create!(attributes)
  puts "Created #{toilet.name}"
end
puts "Finished!"

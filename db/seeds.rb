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
users = [user1, user2, user3]
photo1 = 'https://images.pexels.com/photos/7045923/pexels-photo-7045923.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
photo2 = 'https://images.pexels.com/photos/7040699/pexels-photo-7040699.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
photo3 = 'https://images.pexels.com/photos/6957082/pexels-photo-6957082.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
photo4 = 'https://images.pexels.com/photos/5860600/pexels-photo-5860600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'

image_urls = [photo1, photo2, photo3, photo4]
i = 0
100.times do
  i += 1
  toilet = Toilet.create(
    name: "#{Faker::Ancient.unique.god}'s toilet",
    description: Faker::Quote.famous_last_words,
    location: Faker::Address.city,
    price: rand(0..75),
    user: users.sample
  )
  toilet.photos.attach(io: URI.open(image_urls.sample), filename: "toilet#{i}.png", content_type: 'image/jpeg')
  toilet.save
  p toilet
end

# toilet1 = { name: "Kato's toilet", description: "Very nice toilet with a view over Brussels!", location: "Cantersteen 12, 1000 Bruxelles", price: 7.5, user: user2 }
# toilet2 = { name: "Quynh-Anh's toilet", description: "Also a nice toilet, with heated seating.", location: "Rue du MArché aux Herbes 56, 1000 Bruxelles", price: 4, user: user1 }
# toilet3 = {name: "Dorian's toilet", description: "The best toilet you will ever use.", location: "Chaussée d'Alsemberg 252, 1190 Forest", price: 4, user: user3 }
# [toilet1, toilet2, toilet3].each do |attributes|
#   toilet = Toilet.create!(attributes)
#   puts "Created #{toilet.name}"
# end

Toilet.where(latitude: nil).each do |toilet|
  toilet.destroy
end
puts "Finished!"

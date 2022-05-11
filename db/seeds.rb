require 'open-uri'

puts "Destroy all Users"
User.destroy_all
puts "Destroy all Skatespots"
Skatespot.destroy_all

puts "Create admin..."

admin = User.create(
  username: "Starfoulah",
  email: "admin@gmail.com",
  password: "adminadmin"
)

puts "Create Skatespot"

skatespot = Skatespot.create(
  address: "Parc de bercy, Paris",
  name: "Bercy la famille"
)
photo = URI.open("https://res.cloudinary.com/baptistev/image/upload/v1652198264/development/7xwgk7d3qud72v9h30dnpkrvil3l.jpg")
skatespot.photo.attach(io: photo, filename: 'a.png', content_type: 'image/png')
skatespot.save
puts "Finish"

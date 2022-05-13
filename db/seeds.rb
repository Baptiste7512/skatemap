require 'open-uri'

puts "Destroy all Conversation"
Conversation.destroy_all

puts "Destroy all Users"
User.destroy_all

puts "Destroy all Skatespots"
Skatespot.destroy_all

puts "Create admin..."

admin = User.create(
  username: "Baptiste",
  email: "admin@gmail.com",
  password: "adminadmin"
)

puts "Create Skatespot Bercy"

skatespot = Skatespot.create(
  address: "Parc de bercy, Paris",
  name: "Bercy la famille"
)
photo = URI.open("https://res.cloudinary.com/baptistev/image/upload/v1652198264/development/7xwgk7d3qud72v9h30dnpkrvil3l.jpg")
skatespot.photo.attach(io: photo, filename: 'a.png', content_type: 'image/png')
skatespot.save
puts "Create Skatespot Republique"
skatespot = Skatespot.create(
  address: "9 Place de la République, Paris",
  name: "Repulife"
)
photo = URI.open("https://res.cloudinary.com/baptistev/image/upload/v1652198450/development/cyiectcx1p48s3gakzyzqcoz110g.jpg")
skatespot.photo.attach(io: photo, filename: 'a.png', content_type: 'image/png')
skatespot.save

puts "Create Skatespot Pantin"
skatespot = Skatespot.create(
  address: "Place de la Pointe, 93500, Pantin",
  name: "Skatepark de Pantin"
)
photo = URI.open("https://res.cloudinary.com/baptistev/image/upload/v1652435176/development/Skatepark_Pantin_2_uqs4o4.jpg")
skatespot.photo.attach(io: photo, filename: 'a.png', content_type: 'image/png')
skatespot.save

puts "Create Skatespot Arcueil"
skatespot = Skatespot.create(
  address: "58 Avenue François Vincent Raspail, 94110 Arcueil, France",
  name: "Arcueil"
)
photo = URI.open("https://res.cloudinary.com/baptistev/image/upload/v1652435366/development/Skatepark_bowl_Arcueil_lggzkl.jpg")
skatespot.photo.attach(io: photo, filename: 'a.png', content_type: 'image/png')
skatespot.save

puts "Fac diderot"
skatespot = Skatespot.create(
  address: "Esplanade Pierre Vidal-Naquet, 75013 Paris, France",
  name: "Diderot"
)
photo = URI.open("https://res.cloudinary.com/baptistev/image/upload/v1650634480/development/rxn3b7oprcz76v8w4h18io8wp0pq.jpg")
skatespot.photo.attach(io: photo, filename: 'a.png', content_type: 'image/png')
skatespot.save
puts "Finish"

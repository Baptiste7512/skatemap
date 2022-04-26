

puts "Destroy all User"
User.destroy_all

puts "Create admin..."

admin = User.create(
  username: "Starfoulah",
  email: "admin@gmail.com",
  password: "adminadmin"
)

puts "Finish"

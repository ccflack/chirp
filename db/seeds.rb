# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@users =[]

50.times do
 @users << User.create(
  username: Faker::Internet.user_name+"#{rand(1..1000)}",
  password: "robot",
  firstname: Faker::Name.first_name,
  lastname: Faker::Name.last_name
)
end

50.times do
  @users.sample.tweets << Tweet.create(
  body: Faker::Lorem.sentence,
)
end

30.times do
  @users.sample.toggle_follow!(@users.sample)
end

User.create(
  username: "briangm",
  password: "kansasj12",
  firstname: "Brian",
  lastname: "McMillian"
)

User.create(
  username: "sallyw",
  password: "password",
  firstname: "Sally",
  lastname: "Wieland"
)

User.create(
  username: "cflack",
  password: "admin",
  firstname: "Chris",
  lastname: "Flack"
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times {
  faculty = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: 'password',
  access: 'faculty'
 )

  faculty.proposals.create(summary: "summary", hypothesis: "hypo", status: "open")
}

10.times {
  lab_tech = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: 'password',
  access: 'labtech'
 )
}

user = User.first
user2 = User.find(2)
user3 = User.find(3)
user4 = User.find(4)

user.proposals.create(summary: "Testing the intelligence of Jason Wong", hypothesis: "It is likely that he is a genius")
user2.proposals.create(summary: "Exploring the depths of Carlos's insanity", hypothesis: "It is likely that he is batshit crazy")
user3.proposals.create(summary: "Lana's tolerance for the insanity", hypothesis: "It is likely that her tolerance faded a long time ago")
user4.proposals.create(summary: "Kiv's horrible english accent", hypothesis: "His accent is close but needs a lot of work.")

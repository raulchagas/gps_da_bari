# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# puts "Cleaning database"
Recipe.destroy_all

puts "Creating user"
@user = User.create!(
  email: "teste@teste",
  password: "aaaaaa",
  vitamin_record: 1
)

@user2 = User.create!(
  email: "teste2@teste",
  password: "aaaaaa",
  vitamin_record: 4
)

puts "Creating prescription"
Prescription.create!(
  title: "Tylenol",
  user: @user
)
Prescription.create!(
  title: "Advil",
  user: @user
)

puts "Creating vitamins"

Vitamin.create!(
  date: (Date.today - 5),
  user: @user,
)
Vitamin.create!(
  date: (Date.today - 1),
  user: @user,
)

Vitamin.create!(
  date: (Date.today - 6),
  user: @user2,
)
Vitamin.create!(
  date: (Date.today - 5),
  user: @user2,
)
Vitamin.create!(
  date: (Date.today - 4),
  user: @user2,
)
Vitamin.create!(
  date: (Date.today - 3),
  user: @user2,
)
Vitamin.create!(
  date: (Date.today - 1),
  user: @user2,
)

@vitamins = Vitamin.all
@vitamins.each do |vitamin|
  puts "#{vitamin.date}"
end

@prescriptions = Prescription.all
@prescriptions.each do |prescription|
  puts "#{prescription.title} - #{prescription.user.email}"
end


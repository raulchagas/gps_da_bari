# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database"
Recipe.destroy_all
Prescription.destroy_all
User.destroy_all
Vitamin.destroy_all


puts "Creating user"
@user = User.create!(
  email: "teste@teste",
  password: "aaaaaa",
  vitamin_record: 2
)



puts "Creating recipes"
times = [15, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
50.times do
  Recipe.create!(
    title: Faker::Food.dish,
    description: Faker::Food.description,
    calories: rand(10..1000),
    prep_time: times.sample,
    ranking: rand(0..5)
  )
end



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
  date: (Date.today - 6),
  user: @user,
)

Vitamin.create!(
  date: (Date.today - 5),
  user: @user,
)
Vitamin.create!(
  date: (Date.today - 4),
  user: @user,
)
Vitamin.create!(
  date: (Date.today - 2),
  user: @user,
)
Vitamin.create!(
  date: (Date.today - 1),
  user: @user,
)

@vitamins = Vitamin.all
@vitamins.each do |vitamin|
  puts "#{vitamin.date}"
end

puts "#{@user.email}"

@prescriptions = Prescription.all
@prescriptions.each do |prescription|
  puts "#{prescription.title} - #{prescription.user.email}"
end

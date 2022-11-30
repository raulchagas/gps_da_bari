# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database"
Recipe.destroy_all
User.destroy_all
Prescription.destroy_all


puts "Creating user"
@user = User.create!(
  email: "raul@gmail",
  password: "aaaaaa",
  vitamin_record: 4,
  target_weight: 82,
  weight_before_surgery: 112
)

@user2 = User.create!(
  email: "teste2@teste",
  target_weight: 82,
  weight_before_surgery: 120,
  password: "aaaaaa",
  vitamin_record: 3
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

weights = [87,89,85,78,81,85,85,88,90,93,95,98,105,110,112]
@datey = Date.today
puts "Creating weights"
weights.each do |w|
  @datey = @datey -1
  Weight.create!(
    value: w,
    user: @user,
    date: @datey
  )
end



puts "Creating vitamins"
Vitamin.create!(
  date: (Date.today - 10),
  user: @user,
)
Vitamin.create!(
  date: (Date.today - 9),
  user: @user,
)
Vitamin.create!(
  date: (Date.today - 8),
  user: @user,
)
Vitamin.create!(
  date: (Date.today - 7),
  user: @user,
)
Vitamin.create!(
  date: (Date.today - 4),
  user: @user,
)
Vitamin.create!(
  date: (Date.today - 3),
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

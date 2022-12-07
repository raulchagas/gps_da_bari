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
  weight_before_surgery: 112,
  first_name: "Raul",
  last_name: "Chagas",
  date_of_surgery: "01/01/2022",
  age: 41,
  height: 176
)

@user.avatar.attach(io: File.open(Rails.root.join('app/assets/images/raul_pic.png')), filename: "user_avatar", content_type: "image_png")

@user2 = User.create!(
  email: "teste2@teste",
  target_weight: 82,
  weight_before_surgery: 120,
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

weights = [87,89,85,78,81,85,85,88,89,92,90,91,92,93,97,98,95,95,95,95,100,100,100,100,98,98,98,98,105,105,105,105,110,110,110,110,112,112,112]
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

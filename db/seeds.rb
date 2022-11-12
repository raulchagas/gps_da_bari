# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database"
Recipe.destroy_all


puts "Creating recipes"


times = [15, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
10.times do
  Recipe.create!(
    title: Faker::Food.dish,
    description: Faker::Food.description,
    calories: rand(10..1000),
    prep_time: times.sample,
    ranking: rand(0..5)
  )
end

@recipes = Recipe.all

@recipes.each do |recipe|
  puts "#{recipe.title} - #{recipe.description} - #{recipe.calories} - #{recipe.prep_time} - #{recipe.ranking}"
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create!(
  title: "test_単体",
  body: "test_単体"
)

10.times do |number|
  Book.create!(title: "test_#{number}", body: "test_#{number}")
end
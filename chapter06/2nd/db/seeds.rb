# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |user_number|
  User.create(name: "test@test#{user_number+1}", email: "test@test#{user_number+1}", password: "test@test#{user_number+1}")
  3.times do |book_number|
    Book.create(title:"title#{book_number+1}", body:"opinion#{book_number+1}", user_id: user_number+1 )
  end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = 100.times.map do
  User.create!(name: Faker::Superhero.name, email: Faker::Internet.safe_email)
end

5000.times do
  Link.create!(
    title: Faker::Book.title,
    user: user.sample,
    link: Faker::Internet.url,
    thumbnail: "https://unsplash.it/300/300?image=#{rand(1084)}",
    votes: 1 + rand(100000),
    created_at: Faker::Date.between(3.years.ago, Date.today)
  )
end

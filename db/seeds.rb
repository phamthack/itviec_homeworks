# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
1000.times do |i|
  user = User.create!(name: Faker::Name.name,
                      status: [:active, :inactive, :banned, :pending].sample,
                      city: [:hcm, :hn, :dn, :other].sample,
                      subscribe_status: [:subscribed, :unsubscribed].sample
                      )
  i.times do |sub_i|
    Post.create!(title: Faker::Name.name, user: user)
  end
end
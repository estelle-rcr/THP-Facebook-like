# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::UniqueGenerator.clear

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
JoinTableGossipTag.destroy_all
JoinTableMessageRecipient.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

10.times do |index|
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Number.decimal_part(digits: 5)
  )
end

10.times do |index|
  User.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    email: Faker::Internet.email, 
    age: Faker::Number.within(range: 16..90),
    password: Faker::Code.asin,
    city: City.all.sample
    )
end

20.times do |index|
  Gossip.create!(
    title: Faker::Games::Heroes.klass,
    content: Faker::ChuckNorris.unique.fact, 
    author: User.all.sample
  )
end

10.times do |index|
  Tag.create!(
   title: Faker::Book.genre
  )
end


15.times do |index|
  JoinTableGossipTag.create!(
   gossip: Gossip.all.sample,
   tag: Tag.all.sample
  )
end

10.times do |index|
  PrivateMessage.create!(
   content: Faker::Games::Witcher.quote,
   sender: User.all.sample
  )
end

15.times do |index|
  JoinTableMessageRecipient.create!(
   private_message: PrivateMessage.all.sample,
   recipient: User.all.sample
  )
end

15.times do |index|
  Comment.create!(
   content: Faker::Games::WorldOfWarcraft.quote,
   user: User.all.sample,
   gossip: Gossip.all.sample
  )
end

#20.times do |index|
#  Like.create!(
#   user: User.all.sample,
#   gossip: Gossip.all.sample
#  )
#end
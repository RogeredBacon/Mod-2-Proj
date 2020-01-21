# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Food.fruits, password: 'hello', admin?: false)
end

25.times do
    Document.create(data: Faker::Lorem.paragraph, public?: Faker::Boolean.boolean, editable?: true)
end

i = 1
25.times do
    DocumentAccess.create(user_id: (1..10).to_a.sample, document_id: i)
    i += 1
end

10.times do
    DocumentAccess.create(user_id: (1..10).to_a.sample, document_id: (1..25).to_a.sample)
end


Friendship.create(user_id: 1, friend_user_id: 2, confirmed?: true)
Friendship.create(user_id: 2, friend_user_id: 7, confirmed?: true)
Friendship.create(user_id: 1, friend_user_id: 10, confirmed?: true)
Friendship.create(user_id: 3, friend_user_id: 1, confirmed?: true)
Friendship.create(user_id: 1, friend_user_id: 4, confirmed?: true)

7.times do
    Message.create(data: "#{Faker::Lorem.words}", friendship_id: (1..5).to_a.sample)
end
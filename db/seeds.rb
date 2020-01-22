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
    DocumentAccess.create(user: User.all.sample, document_id: i)
    i += 1
end

10.times do
    DocumentAccess.create(user: User.all.sample, document: Document.all.sample)
end


Friendship.create(user: User.first, friend_user: User.last, confirmed?: true)
Friendship.create(user: User.second, friend_user: User.third, confirmed?: true)
Friendship.create(user: User.fourth, friend_user: User.second, confirmed?: true)
Friendship.create(user: User.first, friend_user: User.fourth, confirmed?: true)
Friendship.create(user: User.last, friend_user: User.second, confirmed?: true)

Message.create(data: [{User.first => 'akjdnkaw'}, {User.last => 'scscds'}, {User.first => 'amxamal'}], friendship: Friendship.first)
Message.create(data: [{User.second => 'sdcscs'}, {User.second => 'wewe'}, {User.third => 'wfwdw'}], friendship: Friendship.second)
Message.create(data: [{User.second => 'wwkkjd'}, {User.fourth => 'scscd'}, {User.second => 'acsdc'}], friendship: Friendship.third)
Message.create(data: [{User.first => 'wedjoiej'}, {User.fourth => 'wedwoij'}, {User.first => 'ijnjjd'}], friendship: Friendship.fourth)
Message.create(data: [{User.second => 'wewddw'}, {User.last => 'iweij'}, {User.last => 'ijew'}], friendship: Friendship.last)
Message.create(data: [{User.first => 'wdwddw'}, {User.last => 'wewedew'}, {User.last => 'sewdwdw'}], friendship: Friendship.first)

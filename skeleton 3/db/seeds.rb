# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#user1 = User.create!(user_name: "Mike", password: "skahda", session_token: nil)
user2 = User.create!(user_name: "Lebron", password: "123456", session_token: nil)
cat1 = Cat.create!(birth_date: "2015/01/01", color:"black", name:"Harry", sex:"M", description: "harry has a lot of fur", user_id: user2.id)


cat2 = Cat.create!(birth_date: "2012/02/02", color:"black", name:"Johnny", sex:"M", description: "tim has a lot of fur", user_id: 5)


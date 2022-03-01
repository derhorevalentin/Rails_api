require 'faker'

User.destroy_all
Article.destroy_all

user = User.create(username: "Vali", password:"123456", age:"31")

10.times do
  Article.create(title:Faker::Games::WorldOfWarcraft.hero ,  content:Faker::Games::WorldOfWarcraft.class_name, user_id: 10)
end



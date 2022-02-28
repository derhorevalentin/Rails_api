require 'faker'

30.times do
  Article.create(title:Faker::Games::WorldOfWarcraft.hero ,  content:Faker::Games::WorldOfWarcraft.class_name)
end

user = User.create(username: "Vali", password:"123456", age:"31")

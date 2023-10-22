User.create!(name:  "Koki Katsumata",
             email: "sample@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
						 admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@gmail.com"
  password = "foobar"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
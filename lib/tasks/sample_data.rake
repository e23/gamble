namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end

def make_users
  99.times do |n|
    username  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(username:     username,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end
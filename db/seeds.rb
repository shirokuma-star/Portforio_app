# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

# 追加のユーザーをまとめて生成する
40.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end



40.times do |n|
  k = n + 1
  id = k
  user_id = k
  content = "test content " * 5
  Micropost.create!(
                    id: id, 
               content: content,
               user_id: user_id,
               )
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者追加用の記述。emailとパスワードを書き換えてrails db:seedすると登録

 Admin.create!(
     email: ENV['ADMIN_KEY'],
     password: ENV['ADMIN_PASSWORD'],
 )

users = User.create!(
  [
    {email: ENV['USER1_KEY'], user_name: '三浦', password: ENV['USER1_PASSWORD'], profile: 'このサイトを作った人です', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user1.jpg"), filename:"user1.jpg")},
    {email: '2@2.com', user_name: '山田', password: ENV['USER1_PASSWORD'], profile: 'DTMで音楽を作っています', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user2.jpg"), filename:"user2.jpg")},
    {email: '3@3.com', user_name: 'ギターヒーロー', password: ENV['USER1_PASSWORD'], profile: 'ギター大好きです！ギター歴5年', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user3.jpg"), filename:"user3.jpg")},
    {email: '4@4.com', user_name: '池っち', password: ENV['USER1_PASSWORD'], profile: 'ロックが大好きです！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user4.jpg"), filename:"user4.jpg")},
    {email: '5@5.com', user_name: 'Alex', password: ENV['USER1_PASSWORD'], profile: '閲覧用', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user5.jpg"), filename:"user5.jpg")},
  ]
)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者追加用の記述。emailとパスワードを書き換えてrails db:seedすると登録

 Admin.create!(
     email: '1@1.com',
     password: 'password',
 )

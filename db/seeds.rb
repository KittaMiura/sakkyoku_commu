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
    {email: '2@2.com', user_name: '山田', password: ENV['USER2_PASSWORD'], profile: 'DTMで音楽を作っています', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user2.jpg"), filename:"user2.jpg")},
    {email: '3@3.com', user_name: 'ギターヒーロー', password: ENV['USER3_PASSWORD'], profile: 'ギター大好きです！ギター歴5年', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user3.jpg"), filename:"user3.jpg")},
    {email: '4@4.com', user_name: '池っち', password: ENV['USER4_PASSWORD'], profile: 'ロックが大好きです！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user4.jpg"), filename:"user4.jpg")},
    {email: '5@5.com', user_name: 'Alex', password: ENV['USER5_PASSWORD'], profile: '閲覧用', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user5.jpg"), filename:"user5.jpg")},
    {email: '6@6.com', user_name: '橋本', password: ENV['USER6_PASSWORD'], profile: 'ピアノが好きです。作曲も2年ほどやってます', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user6.jpg"), filename:"user6.jpg")},
    {email: '7@7.com', user_name: '河本', password: ENV['USER7_PASSWORD'], profile: ''},
    {email: '8@8.com', user_name: 'DJ松本', password: ENV['USER8_PASSWORD'], profile: 'ヒップホップ系の曲を作ってます。DJもたまにやります。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user8.jpg"), filename:"user8.jpg")},
    {email: '9@9.com', user_name: 'Bassたこ', password: ENV['USER9_PASSWORD'], profile: 'ベース歴5年、ギター歴1年です！作曲もたまにやります！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user9.jpg"), filename:"user9.jpg")},
  ]
)

Tag.create!(
  [
    {name: 'チュートリアル'},
    {name: 'グループ'},
    {name: '曲解説'},
    {name: '自己紹介'},
   ]
 )

Post.create!(
  [
    {title: 'このサイトについて', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post1.jpg"), filename:"post1.jpg"), introduction: "作曲コミュは「<strong>作曲や演奏についてのテクニックや情報をシェアするためのサイト</strong>」です。<br><br>作曲についての自分が得たTipsやテクニックをシェアすることによって、<br>これから作曲がしたい人達や作曲する上で新たな手法を得たい人達が活用できるようなサイトがあればいいなと思い、<br>このサイトを立ち上げました。<br><br>これからも様々な機能を追加しようと思いますので、是非ご活用ください。", user_id: users[0].id },
    {title: '自己紹介', introduction: "山田と申します！<br><br>こちらのサイトで作曲についての情報を見たいと思い登録しました！<br><br>自分からもオススメのテクニックや情報があれば投稿しようと思います。<br><br>よろしくお願いします！", user_id: users[1].id },
    {title: 'オススメのギター関連サイト', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post3.jpg"), filename:"post3.jpg"), introduction: '自分のメモ代わりも含めて、オススメのギター関連サイトをここにまとめようと思います。<br><br><a href="https://www.ufret.jp/"><strong>「U-FRET」</strong></a><br>既存曲のコードが掲載されています。自分は弾き語りの練習する時に活用しています。<br><br><a href="https://guitar-hakase.com/renshu/"><strong>「エレキギター博士」</strong></a><strong><br></strong>エレキギター博士の記事はとても便利な情報が更新されていますので、練習以外の記事もオススメです。<br><br><a href="https://www.youtube.com/watch?v=df0cyV9hB_A&amp;ab_channel=%E8%90%A9%E5%8E%9F%E6%82%A0%E3%82%AE%E3%82%BF%E3%83%BC%E6%95%99%E5%AE%A4"><strong>「初心者ギタートレーニングメニュー詰め合わせ」</strong></a><strong><br></strong>サイトでなくYoutubeの動画ですが、練習に最適です。', user_id: users[2].id },
    {title: 'グループを作成しました。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/group1.jpg"), filename:"group1.jpg"), introduction: 'バンド好きの人が交流できるグループを作成しました！<br><br><a href="https://ec2d3748cf6d4664b7e03e47bc578920.vfs.cloud9.ap-northeast-1.amazonaws.com/groups/1">こちらのリンク</a>から参加可能ですので、是非バンド好きの方はご参加ください！', user_id: users[0].id },
    {title: '作曲関連のオススメのサイト', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post5.jpg"), filename:"post5.jpg"), introduction: '作曲、DTM関連のオススメのサイトを見つけたので、こちらで紹介します！<br><br><a href="https://dtmbu.com/"><strong>「DTM部」</strong></a><br>こちらのサイトはDTMに関連した情報をまとめているサイトです。<br>作曲についてのテクニックだけでなく、機材についての情報もまとめています。<br><br><a href="https://www.superdtmnews.com/"><strong>「超DTM速報」</strong></a><strong><br></strong>こちらのサイトはDTMに関する最新の情報をメインに更新しているサイトです。<br>機材のことについてだけでなくイベントに関しての情報もまとめています。<br><br><a href="https://sleepfreaks-dtm.com/category/sale/"><strong>「sleepfreaks DTMセール情報」</strong></a><strong><br></strong>こちらではDTMで使用するVSTプラグインのセール情報をまとめています。<br>セールが何日までかの情報も掲載されており、プラグインをよく使う人にはオススメのサイトです。<br><br>以上になりますが、もしこのサイト以外にもオススメのサイトがあれば、コメントで是非教えてください！', user_id: users[1].id },
  ]
)

Group.create!(
  [
    {name: 'バンド音楽ファングループ', group_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/group1.jpg"), filename:"group1.jpg"), introduction: "バンド音楽が好きな人のグループです！\r\n是非バンドについて語り合いましょう", status: "誰でもOK！", owner_id: users[0].id, user_id: users[0].id, index_groups_on_user_id: users[0].id},
  ]
)
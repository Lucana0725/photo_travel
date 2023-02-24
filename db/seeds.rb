# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログイン用ユーザーデータ
Admin.create!(
  email: 'admin@example.com',
  password: 'hogehoge'
)

User.create!(
  [
    {id: 1, email: "taro@example.com", password: "hogehoge", last_name: "山田", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", nickname: "Taro", introduction: "BMW 320乗ってます！車好きの方お気軽にどうぞ！", is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user_1.jpg"), filename: "user_1.jpg")},
    {id: 2, email: "k@example.com", password: "hogehoge", last_name: "津田", first_name: "蔵那", last_name_kana: "ツダ", first_name_kana: "クラナ", nickname: "Kura", introduction: "VAB乗ってます！仲良くしましょー！", is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user_2.jpg"), filename: "user_2.jpg")},
    {id: 3, email: "ai@example.com", password: "hogehoge", last_name: "佛淵", first_name: "愛", last_name_kana: "ホトケブチ", first_name_kana: "アイ", nickname: "愛", introduction: "Fiat500乗ってます！\r\nよろしくお願いします😊", is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user_3.jpg"), filename: "user_3.jpg")},
    {id: 4, email: "sou@example.com", password: "hogehoge", last_name: "塚本", first_name: "颯", last_name_kana: "ツカモト", first_name_kana: "ソウ", nickname: "つかちゃん", introduction: "ノア、ようやく納車された！！！", is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user_4.jpg"), filename: "user_4.jpg")},
    {id: 5, email: "momoka@example.com", password: "hogehoge", last_name: "桑野", first_name: "萌々香", last_name_kana: "クワノ", first_name_kana: "モモカ", nickname: "momoka", introduction: "愛車のクーパーでいろんなとこ出掛けて行きます🚗", is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user_5.jpg"), filename: "user_5.jpg")},
    {id: 6, email: "tatsuya@example.com", password: "hogehoge", last_name: "若槻", first_name: "達也", last_name_kana: "ワカツキ", first_name_kana: "タツヤ", nickname: "ツッキー", introduction: "CX-5乗り！", is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user_6.jpg"), filename: "user_6.jpg")}
  ]
)

Travel.create!(
  [
    {title: "森林の前", body: "〇〇県☓☓市の◯◯公園横の森林前で撮影。公園は子どもたちや子連れのお母さんたちで賑わう憩いの場ですが、少し離れたこちらは静かで雰囲気もあるので車とマッチします！", address: nil, latitude: 34.75141543280001, longitude: 134.19709885919931, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/travel_1.jpg"), filename: "travel_1.jpg"), user_id: 1},
    {title: "海沿いの小休憩", body: "ドライブの帰り道に休憩で立ち寄った施設の駐車場にて。", address: nil, latitude: 34.53786577409046, longitude: 134.99165369564136, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/travel_2.jpg"), filename: "travel_2.jpg"), user_id: 2},
    {title: "静かな街の一角", body: "買い物帰りに立ち寄った静かな街の一角です。", address: nil, latitude: 34.690304998494625, longitude: 135.5014868364643, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/travel_3.jpg"), filename: "travel_3.jpg"), user_id: 3},
    {title: "都会の真ん中にて", body: "納車後長距離ドライブと称して友達に会いに東京まで！新しい車は都会に映えるね😎", address: nil, latitude: 35.74659502832082, longitude: 139.64694358942845, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/travel_4.jpg"), filename: "travel_4.jpg"), user_id: 4},
    {title: "瀬戸大橋とともに", body: "前の車で友達と一緒に鷲羽山にドライブしたときの写真。\r\n今の車でももう一回行きたいなぁ。", address: nil, latitude: 34.43614933975686, longitude: 133.80788431444685, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/travel_5.jpg"), filename: "travel_5.jpg"), user_id: 2},
    {title: "並木ばやしの中で", body: "旅行の思い出。\r\nきれいな場所で撮影できた！", address: nil, latitude: 35.09723861912896, longitude: 135.67408935779042, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/travel_6.jpg"), filename: "travel_6.jpg"), user_id: 5},
    {title: "静かな川沿いにて", body: "納車されたら写真撮ろうって決めてた場所！", address: nil, latitude: 34.574359, longitude: 132.231606, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/travel_7.jpg"), filename: "travel_7.jpg"), user_id: 6}
  ]
)

Comment.create!(
  [
    {comment_body: "おしゃれな場所！", travel_id: 3, user_id: 1},
    {comment_body: "海沿いいいなー！", travel_id: 2, user_id: 3},
    {comment_body: "スポーツカーって感じ！", travel_id: 2, user_id: 1},
    {comment_body: "テストの\r\n改行\r\nメッセージ", travel_id: 2, user_id: 1},
    {comment_body: "クーパーって自然の中でも映えるな！！", travel_id: 6, user_id: 6}
  ]
)
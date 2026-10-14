# タグが1件も存在しない場合だけ初期データを登録する
if Tag.exists?
  puts "タグは登録済みのため、初期データの登録をスキップします"
else
  # 1. 感情タグ (emotion: 15種類)
  emotions = [
  '喜び・楽しさ', '笑顔・ユーモア',
  'ワクワク・好奇心', '熱狂・興奮', '勇気・闘志',
  '安心・安らぎ', '共感・救済',
  '愛おしさ・感謝',
  '涙・号泣', '喪失感・ノスタルジー','感動・発見',
  '衝撃・圧倒', '迷い・葛藤', '恐怖・スリル', '怒り・反骨'
  ]
  emotions.each { |name| Tag.create!(name: name, category: :emotion) }

  # 2. 価値観タグ (value: 16種類)
  values = [
  '挑戦・成長', '努力・継続', '自由・自立', '野心・成功', '情熱・没頭',
  '家族・友情', '愛情・思いやり', '寛容・多様性',
  '誠実・自分らしさ', '内省・孤独', '美意識・感性', '知性・探究心',
  '正義・信念', '貢献・利他', '伝統・文化', '調和・平和'
  ]
  values.each { |name| Tag.create!(name: name, category: :value) }

  # 3. 振り返りタグ (reflection: 5種類)
  reflections = ['不変', '変化', '深化', '成長', '再発見']
  reflections.each { |name| Tag.create!(name: name, category: :reflection) }

  puts "初期タグ作成完了（感情:#{emotions.count} / 価値観:#{values.count} / 振り返り:#{reflections.count}）"
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

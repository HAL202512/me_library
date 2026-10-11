class Tag < ApplicationRecord
  has_many :memory_tags, dependent: :destroy
  has_many :memories, through: :memory_tags

  has_many :reflection_tags, dependent: :destroy
  has_many :reflections, through: :reflection_tags

  # categoryを分かりやすく扱うためのenum定義
  enum :category, { emotion: 0, value: 1, reflection: 2 }

  # 同じカテゴリー内で同じ名前のタグが重複登録されるのを防ぐ
  validates :name, presence: true, uniqueness: { scope: :category }
end
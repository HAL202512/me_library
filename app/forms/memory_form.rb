class MemoryForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  # フォームで入力させる項目（属性）を定義
  attribute :title, :string
  attribute :author, :string
  attribute :genre, :string
  attribute :encountered_year, :integer
  attribute :content, :string
  attribute :user_id, :integer
  attribute :tag_ids # 追加：配列として受け取るため型指定は省略

  # バリデーション（未入力を防ぐ）
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :encountered_year, presence: true
  validates :user_id, presence: true

  # 保存処理
  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      work = Work.find_or_create_by!(
        user_id: user_id,
        title: title,
        author: author,
        genre: genre
      )

      memory = Memory.create!(
        user_id: user_id,
        work_id: work.id,
        encountered_year: encountered_year,
        content: content
      )

      # 追加：タグの保存
      if tag_ids.present?
        memory.tag_ids = tag_ids.reject(&:blank?)
      end
    end
    
    true
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique
    false
  end

  def update(memory)
    return false if invalid?

    ActiveRecord::Base.transaction do
      work = Work.find_or_create_by!(title: title, author: author, genre: genre, user_id: user_id)
      
      memory.update!(
        work_id: work.id,
        encountered_year: encountered_year,
        content: content
      )

      # 追加：タグの更新
      if tag_ids.present?
        memory.tag_ids = tag_ids.reject(&:blank?)
      else
        # すべてのチェックが外された場合は紐付けをクリア
        memory.tag_ids = []
      end
    end
    true
  rescue StandardError => e
    errors.add(:base, "更新に失敗しました: #{e.message}")
    false
  end
end
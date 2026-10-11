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

  # バリデーション（未入力を防ぐ）
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :encountered_year, presence: true
  validates :user_id, presence: true

  # 保存処理
  def save
    # バリデーションに失敗した場合は保存処理を行わず false を返す
    return false if invalid?

    # トランザクション処理: WorkかMemoryのどちらかの保存が失敗した場合、両方の保存を無効化する
    ActiveRecord::Base.transaction do
      # 1. 作品（Work）の保存または取得
      # （同じユーザーが同じタイトルの作品を既に登録している場合は、新しく作らずにその作品データを使う）
      work = Work.find_or_create_by!(
        user_id: user_id,
        title: title,
        author: author,
        genre: genre
      )

      # 2. 思い出（Memory）の保存
      Memory.create!(
        user_id: user_id,
        work_id: work.id,
        encountered_year: encountered_year,
        content: content
      )
    end
    
    true # 全て成功したら true を返す
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique
    false # データベース制約違反などがあれば false を返す
  end
end
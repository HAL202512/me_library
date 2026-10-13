require 'rails_helper'

RSpec.describe MemoryForm, type: :model do
  let(:user) { create(:user) }
  # 現在の仕様に合わせ、実在するタグ名をテストデータとして使用
  let(:tag1) { Tag.create!(name: '感動・発見', category: 'emotion') }
  let(:tag2) { Tag.create!(name: '挑戦・成長', category: 'value') }

  describe '#save' do
    context '正しい値が入力された場合' do
      let(:form) do
        MemoryForm.new(
          user_id: user.id,
          title: 'ハリーポッター',
          author: 'J.K.ローリング',
          genre: '本',
          encountered_year: 2001,
          content: '初めて読んだ時の衝撃がすごかった。',
          tag_ids: [tag1.id, tag2.id]
        )
      end

      it 'WorkとMemoryが保存され、Memoryに指定したTagが紐づくこと' do
        expect { form.save }.to change(Work, :count).by(1)
                            .and change(Memory, :count).by(1)
        
        saved_memory = Memory.last
        expect(saved_memory.tags).to include(tag1, tag2)
      end
    end

    context '必須項目（タイトル）が欠けている場合' do
      let(:form) do
        MemoryForm.new(
          user_id: user.id,
          title: '', # バリデーションエラーを起こすため空にする
          author: 'J.K.ローリング',
          genre: '本', # ★「小説」から「本」に修正
          encountered_year: 2001,
          content: '初めて読んだ時の衝撃がすごかった。',
          tag_ids: [tag1.id, tag2.id]
        )
      end

      it '保存に失敗し、エラーメッセージがセットされること' do
        expect(form.save).to be_falsey
        expect(form.errors[:title]).to include("を入力してください")
      end
    end
  end
end
require 'rails_helper'

RSpec.describe MemoryForm, type: :model do
  let(:user) { create(:user) }
  # app/models/tag.rb の enum定義（emotion, value, reflection）に実在するカテゴリを使用
  let(:tag1) { Tag.create!(name: '感動', category: 'emotion') }
  let(:tag2) { Tag.create!(name: '成長', category: 'value') }

  describe '#save' do
    context '正しい値が入力された場合' do
      let(:form) do
        # app/forms/memory_form.rb に定義されている attribute をすべて正確に渡す
        MemoryForm.new(
          user_id: user.id,
          title: 'ハリーポッター',
          author: 'J.K.ローリング',
          genre: '小説',
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
          genre: '小説',
          encountered_year: 2001,
          content: '初めて読んだ時の衝撃がすごかった。',
          tag_ids: [tag1.id, tag2.id]
        )
      end

      it '保存に失敗し、エラーメッセージがセットされること' do
        expect(form.save).to be_falsey
        expect(form.errors[:title]).to include("can't be blank")
      end
    end
  end
end
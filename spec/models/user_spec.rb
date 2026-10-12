require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    let(:user) { build(:user) } # FactoryBotでメモリ上にダミーを作成

    it '名前、メール、パスワードがあれば有効であること' do
      expect(user).to be_valid
    end

    it '名前がなければ無効であること' do
      user.name = ''
      expect(user).not_to be_valid
    end

    it 'メールアドレスが重複している場合は無効であること' do
      create(:user, email: 'test@example.com')
      user.email = 'test@example.com'
      expect(user).not_to be_valid
    end

    context 'パスワードのバリデーション' do
      it '新規作成時はパスワードが必須であること' do
        new_user = build(:user, password: '', password_confirmation: '')
        expect(new_user).not_to be_valid
      end

      it '更新時はパスワードがなくても有効であること' do
        existing_user = create(:user)
        # 更新処理をシミュレート
        existing_user.name = '新しい名前'
        existing_user.password = ''
        existing_user.password_confirmation = ''
        expect(existing_user).to be_valid
      end
    end
  end
end
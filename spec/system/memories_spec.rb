require 'rails_helper'

RSpec.describe 'Memories', type: :system do
  let(:user) { create(:user) }
  let!(:tag) { Tag.create!(name: '感動', category: 'emotion') }

  before do
    driven_by(:rack_test)
  end

  it 'ユーザーがログインし、新しい思い出を投稿できる一連のフロー' do
# 1. ログイン処理
    visit new_user_session_path
    fill_in 'Email', with: user.email # 実際の画面のラベル名に合わせる
    fill_in 'パスワード', with: 'password123'
    click_button 'ログイン'

    # 2. 投稿画面へ直接遷移（ヘッダー等のリンク名が不明なためパスで直接移動）
    visit new_memory_path # routes.rbより: resources :memories

    # 3. フォームの入力（_form.html.erb の label のテキストと完全一致させる）
    fill_in '作品名', with: 'テスト作品'
    fill_in '作者名', with: 'テスト作者'
    select '小説', from: 'ジャンル' # selectボックスはこう書く
    fill_in '出会った年', with: 2023
    fill_in '当時の思い出', with: 'とても感動した。'
    
    # タグの選択
    check '感動'

# 4. 送信
    find('input[type="submit"]').click

    # 5. 結果の確認（一覧画面等にリダイレクトされ、登録した文字が表示されているか）
    expect(page).to have_content('テスト作品')
    expect(page).to have_content('とても感動した。')
    expect(page).to have_content('感動')
  end
end
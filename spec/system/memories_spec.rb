require 'rails_helper'

RSpec.describe 'Memories', type: :system do
  let(:user) { create(:user) }
  let!(:tag) { Tag.create!(name: '熱狂・興奮', category: 'emotion') }

  before do
    driven_by(:rack_test)
  end

  it 'ユーザーがログインし、新しい思い出を投稿できる一連のフロー' do
    # 1. ログイン処理
    visit new_user_session_path
    fill_in 'Email', with: user.email 
    fill_in 'パスワード', with: 'password123'
    click_button 'ログイン'

    # 2. 投稿画面へ直接遷移
    visit new_memory_path 

    # 3. フォームの入力
    fill_in '作品名', with: 'テスト作品'
    fill_in '作者名', with: 'テスト作者'
    select '本', from: 'ジャンル' 
    fill_in '出会った年', with: 2023
    fill_in '当時の思い出', with: 'とても感動した。'
    
    # タグの選択
    find('label', text: '熱狂・興奮').click

    # 4. 送信
    find('input[type="submit"]').click

    # 5. 結果の確認
    expect(page).to have_content('テスト作品')
    expect(page).to have_content('とても感動した。')
    expect(page).to have_content('熱狂・興奮') 
  end
end
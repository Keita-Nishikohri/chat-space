require 'rails_helper'

feature 'tweet', type: :feature do
  let(:user) { create(:user) }

  scenario 'post tweet' do
    visit root_path
    expect(page).to have_no_content('投稿する')

    # ログイン処理
    # deviseを導入することによって生成されるログインページのプレフィックス
    visit new_user_session_path 
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('投稿する')

    # ツイートの投稿
    expect {
      click_link('投稿する')
      expect(current_path).to eq new_tweet_path
      fill_in 'imege', with: 'https://s.eximg.jp/expub/feed/Padimani/2016/Padimani_83279/Padimani_83279_1.png'
      fill_in 'text', with: 'フィーチャスペックのテスト'
      find('input[type="submit"]').click
    }.to change(Tweet, :count).by(1)
  end
end
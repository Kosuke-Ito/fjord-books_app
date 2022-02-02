# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @user = users(:alice)
    visit root_url
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
    click_on '日報'
  end

  test '#create' do
    click_on '新規作成'
    fill_in 'タイトル', with: 'テスト'
    fill_in '内容', with: 'あああ'
    click_on '登録する'
    assert_text '日報が作成されました。'
  end

  test '#edit' do
    click_on '編集'
    fill_in '内容', with: 'b'
    click_on '更新する'
    assert_text '日報が更新されました。'
  end

  test '#destroy' do
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end
end

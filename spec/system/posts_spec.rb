# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  
  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面(root_path)に「ここはTopページです」が表示されているか' do
        expect(page).to have_content 'ここはTopページです'
      end
      it "top画面に新着・投稿一覧へのリンクが表示されているか" do
        expect(page).to have_link "", href: posts_path
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe "投稿画面(new_post_path)のテスト" do
    before do
      visit new_post_path
    end
    context '表示の確認' do
      it 'new_post_pathが"/posts/new"であるか' do
        expect(current_path).to eq('/posts/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'post[title]', with: Faker::Lorem.characters(number:5)
        fill_in 'post[comment]', with: Faker::Lorem.characters(number:20)
        click_button '投稿'
        expect(page).to have_current_path post_path(Post.last)
      end
    end
  end

  describe "投稿一覧のテスト" do
    before do
      visit posts_path
    end
    context '表示の確認' do
      it '投稿されたものが表示されているか' do
        expect(page).to have_content post.title
        expect(page).to have_link post.title
      end
    end
  end

  describe "詳細画面のテスト" do
    before do
      visit post_path(post)
    end
    context '表示の確認' do
      it '編集リンクが存在しているか' do
        expect(page).to have_link '編集する'
      end
    end
    context 'リンクの遷移先の確認' do
      it '編集の遷移先は編集画面か' do
        edit_link = find_all('a')[3]
        edit_link.click
        expect(current_path).to eq('/posts/' + post.id.to_s + '/edit')
      end
    end
  end

  describe '編集画面のテスト' do
    before do
      visit edit_post_path(post)
    end
    context '表示の確認' do
      it '編集前のタイトルと本文がフォームに表示(セット)されている' do
        expect(page).to have_field 'post[title]', with: post.title
        expect(page).to have_field 'post[comment]', with: post.comment
      end
      it '再投稿ボタンが表示される' do
        expect(page).to have_button '再投稿'
      end
      it '削除リンクが存在しているか' do
        expect(page).to have_link '削除'
      end
    end
    context 'post削除のテスト' do
      it 'postの削除' do
        expect{ post.destroy }.to change{ Post.count }.by(-1)
      end
    end
    context '更新処理に関するテスト' do
      it '更新後のリダイレクト先は正しいか' do
        fill_in 'post[title]', with: Faker::Lorem.characters(number:5)
        fill_in 'post[comment]', with: Faker::Lorem.characters(number:20)
        click_button '保存'
        expect(page).to have_current_path post_path(post)
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'モデルのテスト' do
    it "有効なpostの場合は保存されるか" do
      expect(build(:post)).to be_valid
    end

    context "空白のバリデーションチェック" do
      it "imegeが空白の場合にエラーメッセージが返ってくるか" do
        post = build(:post, image: nil)
        post.valid?
        expect(post.errors[:image]).to include("を入力してください")
      end
      it "commentが空白の場合にエラーメッセージが返ってくるか" do
        post = build(:post, comment: nil)
        post.valid?
        expect(post.errors[:comment]).to include("を入力してください")
      end
    end

    it "commentの文字数が101文字以上の場合エラーメッセージが返ってくるか" do
      post = create(:post)
      # Faker::Lorem.characters(number: 101)でランダムな文字列を101字で作成できる
      post.comment = Faker::Lorem.characters(number: 101)
      post.valid?
      expect(post.errors[:comment]).to include("は100文字以内で入力してください")
    end
  end
end
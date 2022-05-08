require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'モデルのテスト' do
    it "有効なcommentの場合は保存されるか" do
      expect(build(:comment)).to be_valid
    end

    it "comment_textが空白の場合にエラーメッセージが返ってくるか" do
      comment = build(:comment, comment_text: nil)
      comment.valid?
      expect(comment.errors[:comment_text]).to include("を入力してください")
    end

    it "comment_textの文字数が50文字以上の場合エラーメッセージが返ってくるか" do
      comment = build(:comment)
      comment.comment_text = Faker::Lorem.characters(number: 51)
      comment.valid?
      expect(comment.errors[:comment_text]).to include("は50文字以内で入力してください")
    end
  end
end
class Post < ApplicationRecord

 belongs_to :user
 attachment :image
 has_many :comments, dependent: :destroy
 has_many :likes, dependent: :destroy

 has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot

 def liked_by?(user)
   likes.where(user_id: user.id).exists?
 end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
# ~~~ここからフォロー・フォロワー機能~~~
  # フォローを取得
	has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロワーを取得
	has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォローしている人を取得
	has_many :follower_user, through: :follower, source: :followed
  # フォローされている人を取得
	has_many :followed_user, through: :followed, source: :follower
# ~~~ここまでフォロー・フォロワー機能~~~

  attachment :profile_image, destroy: false

# ~~~ここからフォロー・フォロワー機能~~~
  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    follower_user.include?(user)
  end
# ~~~ここまでフォロー・フォロワー機能~~~

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end

class User < ActiveRecord::Base
  has_many :products
  has_many :follows
  has_many :shows, through: :follows
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def following?(show)
    Follow.where(user: self, show: show).count > 0
  end

  def follow(show)
    unless following?(show)
      Follow.create(user: self, show: show)
    end
  end

  def unfollow(show)
    if following?(show)
      Follow.find_by(user: self, show: show).destroy
    end
  end
end

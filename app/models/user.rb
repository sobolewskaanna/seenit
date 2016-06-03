class User < ActiveRecord::Base
  has_many :products
  has_many :follows
  has_many :shows, through: :follows
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:pinterest]

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = "pinterestuser-#{auth.uid}@example.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
     if data = session["devise.pinterest_data"] && session["devise.pinterest_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
    end
  end
end

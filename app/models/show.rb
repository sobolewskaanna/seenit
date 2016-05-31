class Show < ActiveRecord::Base
  has_many :products
  has_many :follows
  has_many :users, through: :follows
end

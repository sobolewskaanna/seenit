class Product < ActiveRecord::Base
  belongs_to :show
  belongs_to :user

  def self.search(search)
    if search
       search.downcase!
       where('LOWER(description) LIKE ?', "%#{search}%")
    else
      all
    end
  end
end

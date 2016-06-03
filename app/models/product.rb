class Product < ActiveRecord::Base
  belongs_to :show
  belongs_to :user

  def self.search(search)
    if search
      # Trigram Search: https://www.postgresql.org/docs/current/static/pgtrgm.html
      where('similarity(description, ?) > 0.1', search)
    else
      all
    end
  end
end

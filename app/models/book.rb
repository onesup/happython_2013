class Book < ActiveRecord::Base
  has_one :rental_book
  serialize :authors
end

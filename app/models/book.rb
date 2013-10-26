class Book < ActiveRecord::Base
  serialize :authors
end

class Book < ActiveRecord::Base
  has_one :rental_book
  serialize :authors
  
  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  def self.search(q)
    search = Tire.search 'books' do
      query do
        string q, :default_operator => "AND"
      end
    end
    search.sort{by :published_at, 'desc'}
    
    search.results
  end
  
end

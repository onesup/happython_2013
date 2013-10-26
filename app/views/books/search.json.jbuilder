json.array!(@books) do |book|
  json.extract! book, :id, :url, :title, :foreign_title, :first_category, :second_category, :authors, :main_author, :publisher, :published_at, :language, :size, :last_page, :isbn10, :isbn13, :price, :reviewed, :description, :index, :series, :image
  json.url book_url(book, format: :json)
end

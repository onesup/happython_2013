json.array! @collection_books do |collection_book|
   json.id collection_book.id
   json.book collection_book.book
end

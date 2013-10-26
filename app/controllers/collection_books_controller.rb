class CollectionBooksController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @collection_books = @user.collection_books
  end
end

class Admin::ReviewsController < ApplicationController
  layout 'admin'
  def index
    @review = Review.all
  end

  def show
  end

  def edit
  end

  def new
  end
end

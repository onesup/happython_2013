class Admin::AnswersController < ApplicationController
  layout 'admin'
  def index
    @answers = Answer.all
  end

  def show
  end

  def edit
  end

  def new
  end
end

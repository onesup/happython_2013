class Admin::NoticesController < ApplicationController
  layout 'admin'
  def index
    @notice = Notice.all
  end

  def show
  end

  def edit
  end

  def new
  end
end

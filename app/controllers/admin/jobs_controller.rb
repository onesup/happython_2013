class Admin::JobsController < ApplicationController
  layout 'admin'
  def index
    @jobs = Job.all
  end

  def show
  end

  def edit
  end

  def new
  end
end

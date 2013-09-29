class HomeController < ApplicationController
  def index
    @jobs = Job.all
    @job = Job.first
  end
  
  def guide
  end
end

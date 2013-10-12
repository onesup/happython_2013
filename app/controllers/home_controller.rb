class HomeController < ApplicationController
  def index
    @jobs = Job.all
    @job = Job.first
    @notices = Notice.all
    @banners = Banner.all
  end
  
  def guide
  end
end

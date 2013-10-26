require 'rake'
require 'crawling'
namespace :start do
  desc "시작"
  task :book => :environment do
    Crawling::CrawlingBook.book_start()
  end
end
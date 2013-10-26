require 'rake'
require 'crawling'
namespace :book do
  desc "시작"
  task :collect_book => :environment do
    Crawling::CrawlingBook.book_start()
  end
  task :collect_url => :environment do
    Crawling::CrawlingBook.start()
  end
  
end
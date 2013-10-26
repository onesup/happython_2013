require 'rake'
namespace :start do
  desc "display the current environment of rake"
  task :book do
    CrawlingBook.book_start()
  end
end
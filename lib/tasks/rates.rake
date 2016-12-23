# -*- encoding : utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'csv'

namespace :rates do
  task :updater => :environment do
    list = Currency.all.map(&:name)
    url = "http://rate.bot.com.tw/xrt/flcsv/0/day"
    download = open(url)
    filename = DateTime.now.strftime('%Y%m%d-%H%M%S')
    IO.copy_stream(download, "./public/csv_files/#{filename}.csv")
    CSV.foreach("./public/csv_files/#{filename}.csv", :headers => :first_row) do |row|
      if list.include?(row[0].upcase)
        currency = Currency.find_by(:name => row[0].upcase)
        currency.rates.create(:current_rate => row[12].to_s)
      end
    end
  end
end
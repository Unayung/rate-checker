# -*- encoding : utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'rest-client'

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

# namespace :checker do
task :app_version_checker => :environment do
  android_url = "https://play.google.com/store/apps/details?id=io.colorgy.app"
  ios_url = "https://itunes.apple.com/tw/app/colorgy-%E8%AA%B2%E8%A1%A8/id1136544719?l=zh&mt=8"
  slack_hook_uri = URI("https://hooks.slack.com/services/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")
      
  play_store_html = RestClient.get(android_url)
  app_store_html = RestClient.get(ios_url)
  play_store_data = Nokogiri::HTML(play_store_html)
  app_store_data = Nokogiri::HTML(app_store_html)
  android_version = play_store_data.css("div.content[@itemprop = 'softwareVersion']").text.strip
  ios_version = app_store_data.css("span[@itemprop = 'softwareVersion']").text.strip
  puts android_version
  puts ios_version
  last_android_record = AppVersion.where(:platform => "android").last
  last_ios_record = AppVersion.where(:platform => 'ios').last

  if (last_android_record.nil? || last_android_record.version != android_version)
  #存起來
  a = AppVersion.new(platform: "android", version: android_version)
  a.save
  #通知
  msg_payload = {
    "channel"    => "#product-team",
    "username"   => "版本機機人",
    "color"      => "#cba",
    "fields"     => [{
      "title" => "偵測到新版本",
      "value" => "Android #{android_version} 版本上架啦！"
      }],
    "icon_emoji" => ":robot_face:"
  }
  Net::HTTP.post_form(slack_hook_uri, { "payload" => msg_payload.to_json })
  end

  if (last_ios_record.nil? || last_ios_record.version != ios_version)
  #存起來
  b = AppVersion.new(platform: "ios", version: ios_version)
  b.save
  #通知
  msg_payload = {
    "channel"    => "#product-team",
    "username"   => "版本機機人",
    "color"      => "#cba",
    "fields"     => [{
      "title" => "偵測到新版本",
      "value" => "iOS #{ios_version} 版本上架啦！"
      }],
    "icon_emoji" => ":robot_face:"
  }
  Net::HTTP.post_form(slack_hook_uri, { "payload" => msg_payload.to_json })
  end  
end
# end
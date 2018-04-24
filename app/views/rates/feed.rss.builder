#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "匯率小提醒"
    xml.description "RateChecker is a simple exchange rate notifier"
    xml.link "https://www.linkedin.com/in/chia-yang-chen-468b6938?trk=hp-identity-name"
    xml.language "zh-TW"

    for report in @reports
      xml.item do
        xml.title "#{report.title} #{report.updated_at.localtime.strftime('%H:%M')}"
        xml.description report.content
        xml.author "unayung@gmail.com (Chen Chia Yang)"
        xml.pubDate report.created_at.rfc822
        xml.link "http://rate.unayung.cc"+report_path(report.id)
        xml.guid "http://rate.unayung.cc"+report_path(report.id)
      end
    end
  end
end
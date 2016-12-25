#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "RateChecker"
    xml.author "Chen Chia Yang"
    xml.description "RateChecker is a simple exchange rate notifier"
    xml.link "https://www.linkedin.com/in/chia-yang-chen-468b6938?trk=hp-identity-name"
    xml.language "en"

    for currency in @currencies
      xml.entry do
        if currency.name
          xml.title currency.name
        else
          xml.title ""
        end
        xml.content currency.latest_rate.current_rate
        xml.author "from BoT"
        xml.pubDate currency.latest_rate.created_at.to_s
        xml.link "http://rate.unayung.cc"+rate_path(currency.latest_rate.id)
        xml.guid currency.latest_rate.id
      end
    end
  end
end
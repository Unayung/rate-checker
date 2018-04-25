#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "星座小提醒"
    xml.description "AstroChecker is a simple notifier"
    xml.link "http://unayung.today/astros/feed?format=rss"
    xml.language "zh-TW"
    for astro in @astros
      xml.item do
        xml.title astro.date
        xml.description astro.description
        xml.author "unayung@gmail.com (Chen Chia Yang)"
        xml.pubDate astro.created_at.rfc822
        xml.link "http://unayung.today"+astro_path(astro.id)
        xml.guid "http://unayung.today"+astro_path(astro.id)
      end
    end
  end
end
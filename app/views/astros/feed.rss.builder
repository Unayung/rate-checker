#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "星座小提醒"
    xml.author "Chen Chia Yang"
    xml.description "AstroChecker is a simple notifier"
    xml.link "https://www.linkedin.com/in/chia-yang-chen-468b6938?trk=hp-identity-name"
    xml.language "en"

    for astro in @astros
      xml.item do
        # if currency.name
        #   if currency.latest_rate.current_rate.to_f > currency.previous_rate.current_rate.to_f
        #     amount = currency.latest_rate.current_rate.to_f - currency.previous_rate.current_rate.to_f
        #     mark = " (上漲 #{amount.round(4)})"
        #   elsif currency.latest_rate.current_rate.to_f < currency.previous_rate.current_rate.to_f
        #     amount = currency.previous_rate.current_rate.to_f - currency.latest_rate.current_rate.to_f
        #     mark = " (下跌 #{amount.round(4)})"
        #   else
        #     mark = " (不變)"
        #   end
        #   xml.title currency.name + " @" + currency.latest_rate.current_rate + mark
        # else
        #   xml.title ""
        # end
        xml.title astro.date
        xml.content astro.description
        xml.author "from 唐綺陽占星"
        xml.pubDate astro.created_at.to_s
        xml.link astro.link
        xml.guid astro.id
      end
    end
    # xml.item do
    #   xml.title "妮妮笑一個 :)"
    #   xml.content "笑一個笑一個"
    #   xml.author "龍龍"
    #   xml.pubDate currency.latest_rate.created_at.to_s
    #   xml.link "http://www.ilovenini.tw"
    #   xml.guid 9999
    # end
  end
end
#encoding: UTF-8

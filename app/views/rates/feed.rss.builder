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
      xml.item do
        if currency.name
          xml.title currency.name
        else
          xml.title ""
        end
        xml.description currency.latest_rate.current_rate
        xml.content currency.latest_rate.current_rate
        xml.author "from BoT"
        xml.pubDate currency.latest_rate.created_at.to_s
        xml.link "http://rate.unayung.cc"+rate_path(currency.latest_rate.id)
        # xml.link "https://www.codingfish.com/blog/" + article.id.to_s + "-" + article.alias
        xml.guid currency.latest_rate.id

        # text = article.text
    # if you like, do something with your content text here e.g. insert image tags.
    # Optional. I'm doing this on my website.
        # if article.image.exists?
        #     image_url = article.image.url(:large)
        #     image_caption = article.image_caption
        #     image_align = ""
        #     image_tag = "
        #         <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>
        #       "
        #     text = text.sub('{image}', image_tag)
        # end
        # xml.description "<p>" + text + "</p>"

      end
    end
  end
end
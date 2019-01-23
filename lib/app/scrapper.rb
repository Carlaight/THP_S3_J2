require 'nokogiri'
require 'open-uri'
require 'json'
require 'csv'
require     name_and_url = []

    url_path.map do |value|
      url_ville = value["href"]
      url_ville[0] = ""
      name_and_url << { "name" => value.text, "url" => "http://annuaire-des-mairies.com" + url_ville }
    end
'google_drive'

class Scrapper

  def url_and_name
    url = "http://annuaire-des-mairies.com/val-d-oise.html"
    doc = Nokogiri::HTML(open(url))
    url_path = doc.css("a[href].lientxt")
    name_and_url
  end

  def get_townhall_email(url)
    doc = Nokogiri::HTML(open(url))
    email = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  end

  def get_all_email(name_and_url)
  name_and_email = []
    name_and_url.map.with_index do |value, i|
      name_and_email << {value["name"] => get_townhall_email(value["url"])}
      break if i == 5
    end
    # puts name_and_email
    name_and_email.reduce Hash.new, :merge
  end

  def initialize
    @all = get_all_email(url_and_name())
  end

  def save_as_json
    File.open("db/emails.json","w+") do |f|
      f.write(@all.to_json)
    end
  end

  def save_as_spreadsheet
    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("1teaqlNAL829yV786mgZ1K6Fleu1eiDIolXTSIIT_d0o").worksheets[0]
    ws[2,1] = "Nom ville"
    ws[2,2] = "Email"
    i = 3
    @all.each do |k,v|
      ws[i,1] = k
      ws[i,2] = v
      i +=1
    end
    ws.save
    ws.relaod
  end

  def save_as_csv
    File.open("db/emails.csv", "w+") do |f|
    @all.each do |k,v|
        f << [k,v]
    end
    end
  end
end

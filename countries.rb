require "nokogiri"
@doc = Nokogiri::HTML(File.read("./_createcountries.html"))
@doc.css('option').each do |o|
  Country.find_or_create_by(name: o.text.strip.squish)
end
Country.find_by(name: 'Country').delete
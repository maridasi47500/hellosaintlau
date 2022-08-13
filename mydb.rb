require "nokogiri"
require "open-uri"
@urlsite="https://hellosaintlau.fr"
@bar="/"
def linkhotels(j,monlien)
    @page=Nokogiri::HTML(URI.open(monlien))
  @page.css('article').each do |event|
    @r=Hotel.find_or_create_by({
      name: event.css('h2')[0].text.strip.squish,
      image: event.css('img')[0].attributes['data-lazy-src'].value,
      url: event.css('.addtoany_list')[0].attributes['data-a2a-url'].value
    })
    j.hotels << @r 
  rescue NoMethodError => e
    p e.message
  end
end
def linkrestaurants(j,monlien)
    @page=Nokogiri::HTML(URI.open(monlien))
  @page.css('article').each do |event|
    @r=Restaurant.find_or_create_by({
      name: event.css('h2')[0].text.strip.squish,
      image: event.css('img')[0].attributes['data-lazy-src'].value,
      url: event.css('.addtoany_list')[0].attributes['data-a2a-url'].value
    })
    j.restaurants << @r 
  rescue NoMethodError => e
    p e.message
  end
end
@doc=Nokogiri::HTML(URI.open("https://hellosaintlau.fr/plan-du-site/"))

#@doc.css('a[href*="event-type"]').each do |e|
#  monlien=e.attributes['href'].value
#  @eventtype=EventType.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("event-type",'').gsub(@bar,""))
#  @page=Nokogiri::HTML(URI.open(monlien))
#  @page.css('article').each do |event|
#    @eventtype.events.find_or_create_by({
#      name: event.css('h2')[0].text.strip.squish,
#      image: event.css('img')[0].attributes['data-lazy-src'].value,
#      description: event.css('.entry-content')[0].text.strip.squish,
#      url: event.css('.addtoany_list')[0].attributes['data-a2a-url'].value
#    })
#  rescue NoMethodError => e
#    p e.message
#  end
#end
#@doc.css('a[href*="localisation_restaurants"]').each do |e|
#  monlien=e.attributes['href'].value
#  eventtype=Location.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("localisation_restaurants_et_bars",'').gsub(@bar,""))
#  linkrestaurants(eventtype,monlien)
#rescue => e
#  next
#
#end
#@doc.css('a[href*="mode_de_paiement_rest"]').each do |e|
#  monlien=e.attributes['href'].value
#  eventtype=Payment.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("mode_de_paiement_restaurant",'').gsub(@bar,""))
#  linkrestaurants(eventtype,monlien)
#rescue => e
#  next
#
#
#end
#@doc.css('a[href*="type_detablissement_restaurant"]').each do |e|
#  monlien=e.attributes['href'].value
#  eventtype=RestaurantType.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("type_detablissement_restaurant",'').gsub(@bar,""))
#  linkrestaurants(eventtype,monlien)
#rescue => e
#  next
#
#end
#@doc.css('a[href*="type_de_cuisine_restaurant"]').each do |e|
#  monlien=e.attributes['href'].value
#  eventtype=Cuisine.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("type_de_cuisine_restaurant",'').gsub(@bar,""))
#  linkrestaurants(eventtype,monlien)
#
#end
@doc.css('a[href*="services_restaurant"]').each do |e|
  monlien=e.attributes['href'].value
  eventtype=RestaurantService.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("services_restaurant",'').gsub(@bar,""))
  linkrestaurants(eventtype,monlien)
rescue => e
  next

end
#
#@doc.css('a[href*="localisation_ou_dormir"]').each do |e|
#  monlien=e.attributes['href'].value
#  eventtype=Location.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("localisation_ou_dormir",'').gsub(@bar,""))
#  linkhotels(eventtype,monlien)
#rescue => e
#  next
#
#end
#@doc.css('a[href*="type_detablissement_ou_dormir"]').each do |e|
#  monlien=e.attributes['href'].value
#  eventtype= HotelType.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("type_detablissement_ou_dormir",'').gsub(@bar,""))
#  linkhotels(eventtype,monlien)
#rescue => e
#  next
#
#end
#@doc.css('a[href*="tarifs_ou_dormir"]').each do |e|
#  monlien=e.attributes['href'].value
#  eventtype= Price.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("tarifs_ou_dormir",'').gsub(@bar,""))
#  @page=Nokogiri::HTML(URI.open(monlien))
#  linkhotels(eventtype,monlien)
#rescue => e
#  next
#
#end
@doc.css('a[href*="services_ou_dormir"]').each do |e|
  monlien=e.attributes['href'].value
  eventtype= HotelService.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("services_ou_dormir",'').gsub(@bar,""))
  linkhotels(eventtype,monlien)
rescue => e
  next

end
@doc.css('a[href*="mode_de_reglement_ou_dormir"]').each do |e|
  monlien=e.attributes['href'].value
  eventtype= Payment.find_or_create_by(name: e.text, url: monlien.gsub(@urlsite,"").gsub("mode_de_reglement_ou_dormir",'').gsub(@bar,""))
  linkhotels(eventtype,monlien)
rescue => e
  next

end

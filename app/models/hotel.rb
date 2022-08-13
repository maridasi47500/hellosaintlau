class Hotel < ApplicationRecord
  has_and_belongs_to_many :prices, :join_table => :hotelshaveprices
  has_and_belongs_to_many :hotel_types, :join_table => :hotelhavehoteltypes
  has_and_belongs_to_many :hotel_services, :join_table => :hotelhavehotelservices
has_and_belongs_to_many :payments, :join_table => :hotelhavepayments
  has_and_belongs_to_many :locations, :join_table => :hotelhavelocations  
  
   def self.prix(n)
    Price.find_by_url(n).hotels
  end
  def self.findbyurl(k)
    where("url like ?","%#{k}%")[0]
  end

    def nexturl
    j=Hotel.where('id > ?',self.id)[0].try(:url)
  end
  def previd
    j=Hotel.where('id < ?',self.id)[0].try(:id)

  end
  def nexttitle
    j=Hotel.where('id > ?',self.id)[0].try(:name)

  end
  def prevtitle
    j=Hotel.where('id < ?',self.id)[0].try(:name)

  end

  def self.localisation(n)
    Location.find_by_url(n).hotels
  end
  def self.modepaiement(n)
    Payment.find_by_url(n).hotels
  end
  def self.typedecuisine(n)
    Cuisine.find_by_url(n).hotels
  end
  def self.services(n)
    HotelService.find_by_url(n).hotels
  end
   def self.prixname(n)
    Price.find_by_url(n).name
  end

  
  def self.localisationname(n)
    Location.find_by_url(n).name
  end
  def self.modepaiementname(n)
    Payment.find_by_url(n).name
  end
  def self.typedecuisinename(n)
    Cuisine.find_by_url(n).name
  end
  def self.servicesname(n)
    HotelService.find_by_url(n).name
  end

end

class Restaurant < ApplicationRecord
  has_and_belongs_to_many :locations, :join_table => :restauranthavelocations
  has_and_belongs_to_many :payments, :join_table => :restauranthavepayments
  has_and_belongs_to_many :restaurant_types, :join_table => :restauranthaverestauranttypes
  has_and_belongs_to_many :restaurant_services, :join_table => :restauranthaverestaurantservices
has_and_belongs_to_many :cuisines, :join_table => :restauranthavecuisines

  def self.localisation(n)
    Location.find_by_url(n).restaurants
  end
  def self.modepaiement(n)
    Payment.find_by_url(n).restaurants
  end
  def self.typedecuisine(n)
    Cuisine.find_by_url(n).restaurants
  end
  def self.findbyurl(k)
    where("url like ?","%#{k}%")[0]
  end

  def self.services(n)
    RestaurantService.find_by_url(n).restaurants
  end
    def self.typesresto(n)
    RestaurantType.find_by_url(n).restaurants
  end
  def nexturl
    j=Restaurant.where('id > ?',self.id)[0].try(:url)
  end
  def previd
    j=Restaurant.where('id < ?',self.id)[0].try(:id)

  end
  def nexttitle
    j=Restaurant.where('id > ?',self.id)[0].try(:name)

  end
  def prevtitle
    j=Restaurant.where('id < ?',self.id)[0].try(:name)

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
    RestaurantService.find_by_url(n).name
  end
      def self.typesrestoname(n)
    RestaurantType.find_by_url(n).name
  end

end

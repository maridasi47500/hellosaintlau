class RestaurantType < ApplicationRecord
  has_and_belongs_to_many :restaurants, :join_table => :restauranthaverestauranttypes
  
end

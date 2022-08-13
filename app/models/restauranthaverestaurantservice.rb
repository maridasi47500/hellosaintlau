class Restauranthaverestaurantservice < ApplicationRecord
      belongs_to :restaurant
  belongs_to :restaurant_service
  validates_uniqueness_of :restaurant_id, scope: :restaurant_service_id
end

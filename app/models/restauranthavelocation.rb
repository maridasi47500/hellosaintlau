class Restauranthavelocation < ApplicationRecord
    belongs_to :restaurant
  belongs_to :location
  validates_uniqueness_of :restaurant_id, scope: :location_id

end

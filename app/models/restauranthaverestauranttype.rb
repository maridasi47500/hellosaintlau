class Restauranthaverestauranttype < ApplicationRecord
        belongs_to :restaurant
  belongs_to :restaurant_type
  validates_uniqueness_of :restaurant_id, scope: :restaurant_type_id

end

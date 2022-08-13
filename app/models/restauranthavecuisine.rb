class Restauranthavecuisine < ApplicationRecord
    belongs_to :restaurant
  belongs_to :cuisine
  validates_uniqueness_of :restaurant_id, scope: :cuisine_id
end

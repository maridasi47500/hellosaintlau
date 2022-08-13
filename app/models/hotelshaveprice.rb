class Hotelshaveprice < ApplicationRecord
    belongs_to :hotel
  belongs_to :price
  validates_uniqueness_of :hotel_id, scope: :price_id
end

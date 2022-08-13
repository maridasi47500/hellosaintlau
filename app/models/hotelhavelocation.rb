class Hotelhavelocation < ApplicationRecord
   belongs_to :hotel
  belongs_to :location
  validates_uniqueness_of :hotel_id, scope: :location_id 
end

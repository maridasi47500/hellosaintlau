class Hotelhavehotelservice < ApplicationRecord
  validates_uniqueness_of :hotel_id, scope: :hotel_service_id
  belongs_to :hotel
  belongs_to :hotel_service
end

class Hotelhavehoteltype < ApplicationRecord
  belongs_to :hotel
  belongs_to :hotel_type
  validates_uniqueness_of :hotel_id, scope: :hotel_type_id
end

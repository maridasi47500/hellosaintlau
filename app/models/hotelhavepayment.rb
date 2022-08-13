class Hotelhavepayment < ApplicationRecord
    belongs_to :hotel
  belongs_to :payment
  validates_uniqueness_of :hotel_id, scope: :payment_id
end

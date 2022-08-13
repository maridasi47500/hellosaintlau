class Restauranthavepayment < ApplicationRecord
      belongs_to :restaurant
  belongs_to :payment
  validates_uniqueness_of :restaurant_id, scope: :payment_id
  
end

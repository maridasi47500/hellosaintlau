class Price < ApplicationRecord
    has_and_belongs_to_many :hotels, :join_table => :hotelshaveprices

end

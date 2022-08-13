class HotelType < ApplicationRecord
  has_and_belongs_to_many :hotels, :join_table => :hotelhavehoteltypes
end

class Location < ApplicationRecord
  has_and_belongs_to_many :restaurants, :join_table => :restauranthavelocations  
  has_and_belongs_to_many :hotels, :join_table => :hotelhavelocations  
end

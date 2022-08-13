class Cuisine < ApplicationRecord
has_and_belongs_to_many :restaurants, :join_table => :restauranthavecuisines
end

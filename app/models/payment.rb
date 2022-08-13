class Payment < ApplicationRecord
    has_and_belongs_to_many :restaurants, :join_table => :restauranthavepayments
has_and_belongs_to_many :hotels, :join_table => :hotelhavepayments
end

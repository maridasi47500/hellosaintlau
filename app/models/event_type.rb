class EventType < ApplicationRecord
  has_and_belongs_to_many :events, :join_table => :eventhaveeventtypes
  
end

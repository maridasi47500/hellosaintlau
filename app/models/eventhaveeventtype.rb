class Eventhaveeventtype < ApplicationRecord
  belongs_to :event
  belongs_to :event_type
  validates_uniqueness_of :event_id, scope: :event_type_id
end

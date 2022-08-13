class Eventshavephoto < ApplicatioinRecord
  belongs_to :event
  belongs_to :photo
  validates_uniqueness_of :event_id, scope: :photo_id
end

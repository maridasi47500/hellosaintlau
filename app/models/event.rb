require 'json'
class Event < ApplicationRecord
  has_many :images
  has_and_belongs_to_many :event_types, :join_table => :eventhaveeventtypes
  attr_accessor :debut, "input_3", "input_4", "input_6", "input_10", "input_8", "input_9", "input_11", "input_12", "input_13", "input_14", "input_15", "input_16", "input_17", "input_18", "gform_ajax", "is_submit_1", "gform_submit", "gform_unique_id", "state_1", "gform_target_page_number_1", "gform_source_page_number_1", "gform_field_values", "gform_uploaded_files"
  before_validation :savefields
    serialize :input_12,Array
validates_presence_of :input_12, :input_3, :input_4, :end, :endtime, :debut, :begintime, :description, :input_14, :input_17, :input_13
def self.postpic(a,b,file)
  File.open(Rails.root.join("public","temporaryimages",a),'wb') do |f|
  f.write file.read
end
      {"status"=>"ok","data"=>{"temp_filename"=>a,"uploaded_filename"=>b}}
end
  def savefields
    d1=self.input_6.to_a.map(&:to_i)
    self.debut = Date.new(d1[2], d1[0],d1[1]) rescue nil
    self.begintime = self.input_8.join(':') rescue nil
    d2=self.input_10.to_a.map(&:to_i)
    self.end = Date.new(d2[2], d2[0],d2[1]) rescue nil
    self.endtime = self.input_9.join(':') rescue nil
self.name =self.input_3
self.place=self.input_4
self.event_types = self.input_12.to_a.map {|x|EventType.find_or_create_by(name: x)}
     self.description = self.input_13
     
    self.telephone = self.input_14
    self.email = self.input_15
    self.other = self.input_16
    self.tarifs=self.input_17
    self.complementtarifs=self.input_18
    begin
    self.images=JSON.parse(self.gform_uploaded_files)["input_19"].map do |x|
      k=Image.new
      begin
      k.newimage(x["temp_filename"], x["uploaded_filename"])
      rescue
      end
      k
    end
    rescue
    end
  end
  def nbfichiermaxatteint?
    x=JSON.parse(self.gform_uploaded_files)['input_19'].length == 3
    x
  rescue => e 
    p x
    p e.message
    false
  end
  def fichiers
    p JSON.parse(self.gform_uploaded_files)['input_19']
    x=JSON.parse(self.gform_uploaded_files)['input_19'].pluck('temp_filename', "uploaded_filename")
    p x
    x
  rescue => e
    p x
    p e.message
     []
  end
  def self.byeventtype(n)
    EventType.find_by_url(n).events
  end
  def self.findbyurl(k)
    where("url like ?","%#{k}%")[0]
  end
  def nexturl
    j=Event.where('id > ?',self.id)[0].try(:url)
  end
  def previd
    j=Event.where('id < ?',self.id)[0].try(:id)

  end
  def nexttitle
    j=Event.where('id > ?',self.id)[0].try(:name)

  end
  def prevtitle
    j=Event.where('id < ?',self.id)[0].try(:name)

  end

end

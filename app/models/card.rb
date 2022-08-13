class Card < ApplicationRecord
  validates_format_of :wp_iec_email, 
  :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true
validates_format_of :wp_iec_femail, 
  :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true
validates_presence_of :wp_iec_name
validates_presence_of :wp_iec_email
validates_presence_of :wp_iec_femail

validates_presence_of :wp_iec_message
  attr_accessor :wp_iec_img, :wp_iec_name, :wp_iec_email, :wp_iec_femail, :wp_iec_message, :wp_iec_scopy
  before_validation :savecard
  def savecard
    
    self.img=wp_iec_img
    self.name=wp_iec_name
    self.email=wp_iec_email
    self.femail = wp_iec_femail
    self.message = wp_iec_message
    self.scopy=wp_iec_scopy
  end
  def mymessages
    list_err={}
    if !self.errors[:wp_iec_name].blank?
    list_err["name"]={"name_ref"=>"wp_iec_name","message"=>"Please fill in the required field."}
    end
    if !self.errors[:wp_iec_email].blank?
    list_err["email"]={"name_ref"=>"wp_iec_email","message"=>"Please fill in the required field."}
    end
    if !self.errors[:wp_iec_femail].blank?

    list_err["femail"]={"name_ref"=>"wp_iec_femail","message"=>"Please fill in the required field."}
    end
    if !self.errors[:wp_iec_message].blank?

    list_err["msg"]={"name_ref"=>"wp_iec_message","message"=>"Please fill in the required field.","type"=>"textarea"}
    end
    list_err
  end
end

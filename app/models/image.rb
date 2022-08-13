class Image < ApplicationRecord
  attr_accessor :temporary, :realurl
  belongs_to :event
  def newimage(a, b)
    self.temporary=a
    self.realurl=b
    write_attribute(:url, b)
  end
  before_save :deplacer
  def deplacer
    `mv "#{Rails.root.join("public","temporaryimages",self.temporary)}" "#{Rails.root.join("app","assets","images",self.realurl)}"`
    
  end
end

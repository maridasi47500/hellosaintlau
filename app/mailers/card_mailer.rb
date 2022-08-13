class CardMailer < ApplicationMailer
  
  def welcome_email
    @card = params[:card]
    @url  = 'http://example.com/login'
    case @card.img
when 2044
       @img=attachments.inline["Colibri.jpg"] = File.read("#{Rails.root}/app/assets/images/Colibri.jpg")
 @img=attachments["Colibri.jpg"]
when 2047
       attachments.inline["coucher-de-soleil.jpg"] = File.read("#{Rails.root}/app/assets/images/coucher-de-soleil.jpg")
       @img=attachments["coucher-de-soleil.jpg"]
     when 2050
       attachments.inline["coucher-de-soleil-siant-laurent-du-maroni.jpg"] = File.read("#{Rails.root}/app/assets/images/coucher-de-soleil-siant-laurent-du-maroni.jpg")
       @img=attachments["coucher-de-soleil-siant-laurent-du-maroni.jpg"]

    when 2053
       attachments.inline["iguane_guyane.jpg"] = File.read("#{Rails.root}/app/assets/images/iguane_guyane.jpg")
       @img=attachments["iguane_guyane.jpg"]

when 2056
       attachments.inline["ciel.jpg"] = File.read("#{Rails.root}/app/assets/images/ciel.jpg")
       @img=attachments["ciel.jpg"]
when 2059
       attachments.inline["carnaval.jpg"] = File.read("#{Rails.root}/app/assets/images/carnaval.jpg")
       @img=attachments["carnaval.jpg"]
    end


    mail(to: "cleo.ordioni@gmail.com", subject: 'You have received an ecard from '+@card.name+'!')
#    if @card.scopy
#      
#    end
  end

end
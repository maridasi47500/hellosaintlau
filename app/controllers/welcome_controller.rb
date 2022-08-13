require 'open-uri'
class WelcomeController < ApplicationController
  layout "ecard", only: :ecard
  layout "plandusite", only: [:plandusite]
  layout "contactus", only: [:contactus, :contactuspost]
  protect_from_forgery except: [:postpic,:myjs,:ajaxecard,:ecard,:annoncezajax]
  def postpic
    render json: Event.postpic(params[:name], params[:original_filename],params[:file])
  end
  def contactus
    @message=Message.new
  end
   def contactuspost
    @message=Message.new(message_params)
    if @message.save
      render :contactok
    else
      
      render :contactus
      
    end
    
  end
  def annoncez
    @event = Event.new
    render layout: "annoncez"
  end
  def annoncezajax
    @event = Event.new(ad_params)
    if @event.save
          render :annoncezajaxok, layout: false

    else
      p @event.errors
          render :annoncezajax, layout: false

    end
  end
  def ajaxecard
    hash = CGI::parse(params[:"form_data"])
    hash.delete("wp_iec_post")
    hash.delete('wp_iec_unique_id')
    hash.delete('wp_iec_ajax_validated')
    hash.delete('wp_iec_action')
    p hash
    p hash.to_h
    myhash= hash.to_a.flatten.each_slice(2).to_a.to_h
          @card=Card.new(myhash) 
      if @card.save
        CardMailer.with(card: @card).welcome_email.deliver_now
        p "yes!!!!!!!!!!!!"
      render html: {"success"=>"true"}.to_json.html_safe, layout: false

      else
          p "no !!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        @a={"success"=>"false","err_msg"=>"Validation errors occurred. Please confirm the fields and submit it again.","invalids"=>@card.mymessages}
  
      p @a
      render html: @a.to_json.html_safe, layout: false
      end

  end
  def index
  end
  def pic
    mypath=request.path
    if params[:namepic].split('.').last != "pdf"
    myfilepath=Rails.root.to_s+"/app/assets/images/"+mypath.split('/').last
    if !File.exist?(myfilepath)
    data = open("https://www.hellosaintlau.fr"+mypath).read 
    
open(myfilepath, 'wb') do |file|
  file << open("https://www.hellosaintlau.fr"+mypath).read 
end

      else
        data=File.read(myfilepath)
  end

    
    send_data data, :type => "image/jpeg", disposition: 'inline'
    else
      filename=mypath.split('/').last
         myfilepath=Rails.root.to_s+"/public/infofiles/"+filename.parameterize
    if !File.exist?(myfilepath)
    data = open("https://www.hellosaintlau.fr"+mypath).read 
    
open(myfilepath, 'wb') do |file|
  file << data 
end

      else
        data=File.read(myfilepath)
  end
      render partial: "inlinepdf", locals: {filename: "/assets/"+filename.parameterize}, layout: false, formats: [:html]

    end
  end
  def myjs
    mypath=request.path
    myfilepath=Rails.root.to_s+"/app/assets/images/"+mypath.split('/').last
    if !File.exist?(myfilepath)
    data = open("https://www.hellosaintlau.fr"+mypath).read 
    
open(myfilepath, 'wb') do |file|
  file << open("https://www.hellosaintlau.fr"+mypath).read 
end

      else
        data=File.read(myfilepath)
  end

    
    send_data data, :type => "text/javascript", disposition: 'inline'
  end
  def ecard
    if params[:card]
      @card=Card.new(card_params) 
      if @card.save
        CardMailer.with(card: @card).welcome_email.deliver_now
      end
    else
      @card=Card.new(img: 2047)
    end
    render layout: "ecard"
  end
  private
  def ad_params
      params.permit(:input_6, :input_10, :input_8, :input_9, :input_12, "input_3", "input_4", "input_6", "input_10", "input_8", "input_9", "input_11", "input_12", "input_13", "input_14", "input_15", "input_16", "input_17", "input_18", "gform_ajax", "is_submit_1", "gform_submit", "gform_unique_id", "state_1", "gform_target_page_number_1", "gform_source_page_number_1", "gform_field_values", "gform_uploaded_files", :input_8=>[], :input_9=>[],:input_12=>[],:input_6=>[], :input_10=>[])
  end
  def message_params
 p=params.permit("input_11_1", "input_1", "input_2", "input_4", "input_5", "input_12", "input_13", "input_14", "input_7_4", "input_7_6", "input_8", "input_9", "is_submit_4", "gform_submit", "gform_unique_id", "state_4", "gform_target_page_number_4", "gform_source_page_number_4", "gform_field_values")   
 p.to_h.to_a.map {|a,b|[a.gsub('.','_'),b]}.to_h
    
  end
  def card_params
    params.require(:card).permit(:wp_iec_img, :wp_iec_name, :wp_iec_email, :wp_iec_femail, :wp_iec_message, :wp_iec_scopy)
  end
 end

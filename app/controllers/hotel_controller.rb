class HotelController < ApplicationController
  layout "restobar"
  layout "myposts", only: [:show,:modepaiement,:services,:prix,:typelogement,:localisation]
  def show
    @post=Hotel.findbyurl(params[:name])
  end
  def hotels
    render layout: "hotel"
  end
  def localisation
    @hotels=Hotel.localisation(params[:name])
    render :posts
  end
  def modepaiement
    @titre=Hotel.modepaiementname(params[:name])
    @posts=Hotel.modepaiement(params[:name])
    render :posts
  end
  def services
    @titre=Hotel.servicesname(params[:name])
    @posts=Hotel.services(params[:name])
    render :posts

  end
  def prix
    @titre=Hotel.prixname(params[:name])
    @posts=Hotel.prix(params[:name])
    render :posts

  end
  def typelogement
    @titre=Hotel.typelogementname(params[:name])
    @posts=Hotel.typelogement(params[:name])
    render :posts
  end
end

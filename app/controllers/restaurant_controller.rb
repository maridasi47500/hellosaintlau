class RestaurantController < ApplicationController
  layout "myposts", only: [:show,:typeresto,:modepaiement,:services,:typelogement,:localisation]
  def show
    @post=Restaurant.findbyurl(params[:name])
  end

  def index
  end
  def localisation
    @posts=Restaurant.localisation(params[:name])
    @titre=Restaurant.localisationname(params[:name])
        render :posts

  end
  def modepaiement
    @posts=Restaurant.modepaiement(params[:name])
    @titre=Restaurant.modepaiementname(params[:name])
        render :posts

  end
  def typedecuisine
        @posts=Restaurant.typedecuisine(params[:name])
        @titre=Restaurant.typedecuisinename(params[:name])
        render :posts

  end
  def services
        @posts=Restaurant.services(params[:name])
        @titre=Restaurant.servicesname(params[:name])
        render :posts
  end
  def typeresto
        @posts=Restaurant.typesresto(params[:name])
        @titre=Restaurant.typesrestoname(params[:name])
        render :posts
  end
end

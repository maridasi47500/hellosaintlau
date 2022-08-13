class EventController < ApplicationController
    layout 'myposts', only: [:show]
  def show
    @post=Event.findbyurl(params[:name])
  end

  def index
  end
  def eventtype
    @events=Event.byeventtype(params[:name])
  end
end

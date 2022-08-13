class DiscoverController < ApplicationController
  def tolive
  render layout: "experience"
  end
  def incontournables
    render layout: "incontournable"
  end  
  def history
    render layout: "histoire"
  end
  def sport
    render layout: "sport"
  end
  def culture
    render layout: 'equipement'
  end
  def mysteres
    render layout: "mystere"
  end
end

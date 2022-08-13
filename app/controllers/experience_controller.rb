class ExperienceController < ApplicationController
  layout "discover", only: [:culture]
  layout 'resto'

  def restaurants
    render layout: "resto"

  end
  def agenda
    render layout: "agenda"
  end
end

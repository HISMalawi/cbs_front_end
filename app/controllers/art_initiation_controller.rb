class ArtInitiationController < ApplicationController
  def index
    if request.post?

    else
      render layout: 'octopus'
    end
  end
end

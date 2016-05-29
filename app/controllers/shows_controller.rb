class ShowsController < ApplicationController
  include HTTParty

  def index
    if params[:search]
      response = HTTParty.get('http://api.tvmaze.com/search/shows?q=' + params[:search])
      if response.success?
        @shows = []
        response.each do |show|
          @show = Show.new
          @show.tvmaze_id = show['show']['id']
          @show.title = show['show']['name']
          if show['show']['image'] != nil
            @show.image_url = show['show']['image']['medium']
          end
          @shows << @show
        end
      else
        p 'error'
      end
    else
      @shows = Show.all
    end
  end

end

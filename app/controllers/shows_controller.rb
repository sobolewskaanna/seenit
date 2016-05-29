class ShowsController < ApplicationController

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
      response = HTTParty.get('http://api.tvmaze.com/shows')
      if response.success?
        @shows = []
        response.each do |show|
          @show = Show.new
          @show.tvmaze_id = show['id']
          @show.title = show['name']
          @show.image_url = show['image']['medium']
          @shows << @show
        end
      else
        p 'error'
      end
    end
  end

end

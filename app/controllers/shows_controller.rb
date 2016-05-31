class ShowsController < ApplicationController
  include HTTParty

  def index
    if params[:search]
      response = HTTParty.get('http://api.tvmaze.com/search/shows?q=' + params[:search])
      if response.success?
        @shows = []
        response.each do |tvmaze_show|
          tvmaze_show = tvmaze_show['show']
          show = Show.find_or_create_by(tvmaze_id: tvmaze_show['id']) do |new_show|
            new_show.title = tvmaze_show['name']
            if tvmaze_show['image'] != nil
              new_show.image_url = tvmaze_show['image']['medium']
            end
          end
          @shows << show
        end
      else
        p 'error'
      end
    else
      @shows = Show.all
    end
  end

end

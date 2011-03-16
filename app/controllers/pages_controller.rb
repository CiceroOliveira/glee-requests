require 'lastfm'

class PagesController < ApplicationController
  def home
    unless params[:song].blank?
      @search_results = search_results(params[:song],params[:artist])
    end
  end

  protected
  def search_results(song,artist)
    lastfm = Lastfm.new('0106743c51b1b22f792a3359ac47c413', 
                        '0cee1e0928f0183d5ae4d293dbcb7d6b')
    
    token = lastfm.auth.get_token

    track_search = lastfm.track.search(song, artist, 10)

    search_results = []
    track_search['results']['trackmatches']['track'].each do |track|
      image_uri = ""
      unless track['image'].nil?
        track['image'].each do |image| 
          image_uri = image['content'] if image['size'] == 'small'
        end
      end
      search_results << {:track => track['name'], :artist => track['artist'], :image => image_uri }
    end
    search_results
  end
end

class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.xml
  def index
    @requests = Request.top_ten
    
    unless params[:song].blank?
      @search_results = search_results(params[:song],params[:artist])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

  # POST /requests
  # POST /requests.xml
  def create
    #@request = Request.new(params[:request])
    @request = Request.new

    respond_to do |format|
      if @request.save_or_update(params)
        format.html { redirect_to requests_path }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { redirect_to requests_path }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    #@request.destroy
    @request.subtract_point

    respond_to do |format|
      format.html { redirect_to(requests_url) }
      format.xml  { head :ok }
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
module RequestsHelper
  def points_for(track,artist)
    request = Request.new
    request.track = track
    request.artist = artist
    return request.total_points
  end
end

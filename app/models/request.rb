class Request
  include Mongoid::Document
  include Mongoid::Timestamps
  field :track, :type => String
  field :artist, :type => String
  field :points, :type => Integer
  
  validates :track, :artist, :points, :presence => true
  validates :track, :uniqueness => {:scope => :artist}

  scope :top_ten, all.desc(:points).limit(10)
  
  def points_assigned
    points_assigned = Request.only(:points).where(:track => self.track, :artist => self.artist).first || {:points => 0}
    points_assigned[:points]
  end
  
  def total_points
    points_assigned
  end
  
  def read_request
    Request.where(:track => self.track, :artist => self.artist).first
  end
  
  def save_or_update(params)
    self.track = params[:track]
    self.artist = params[:artist]
    current_request = read_request
    
    if current_request
      current_request.points +=1
      current_request.save
    else
      self.points = 1
      self.save
    end
  end
  
  def subtract_point
    if self.points == 1
      self.destroy
    else
      self.points -= 1
      self.save
    end
  end
end

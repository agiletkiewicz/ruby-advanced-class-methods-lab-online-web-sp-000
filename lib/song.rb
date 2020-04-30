class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song 
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song
  end
  
   def self.create_by_name(song_name)
     song = self.new 
     @@all << song
     song.name = song_name 
     song
  end
  
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    sorted = @@all.sort_by {|song| song.name}
    sorted
  end
  
  def self.new_from_filename(mp3format)
    array = mp3format.split(/[-.]/)
    artist = array[0].strip
    song = array[1].strip
    new = self.find_or_create_by_name(song)
    new.artist_name = artist 
  end
  
  

end

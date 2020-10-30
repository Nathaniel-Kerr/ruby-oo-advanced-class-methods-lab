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
    song.save #@@all << song
    song
  end

  def self.new_by_name(name)
  song = self.create
  song.name = name
  song
  end

  def self.create_by_name(name)
  song = self.create
  song.name = name
  song
  end

  def self.find_by_name(name)
    result = nil
  @@all.each do |song|
    result = song if song.name == name
    end
    result
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end

  def self.new_from_filename(name)
    x = name.gsub(".mp3", "").split(/\-/)
    song = self.create_by_name(x[1].strip)
    song.artist_name = x[0].strip
    song
  end

  def self.create_from_filename(name)
   self.new_from_filename(name)
  end

  def self.destroy_all
    @@all.clear
  end
end

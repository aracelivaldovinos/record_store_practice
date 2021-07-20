class Album
  attr_reader :id, :name, :year, :genre, :artist
  @@albums = {}
  @@total_rows = 0

  def initialize(name, id, year, genre, artist)
    @name = name
    @id = id || @@total_rows += 1 
    @year = year
    @genre = genre
    @artist = artist
  end
  def self.all
    @@albums.values()
  end
  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)
  end
  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end
  def self.clear
    @@albums = {}
    @@total_rows = 0
  end
  def self.find(id)
    @@albums[id]
  end
  def update(name)
    @name = name
  end
  def delete
    @@albums.delete(self.id)
  end
  def self.search 
    @@albums[year]
  end 
end
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name (name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
     self.all.find do | song |
       name == song.name
     end
  end

  def self.find_or_create_by_name (name)
    if self.find_by_name(name) == nil
       self.create_by_name(name)
    else
       self.find_by_name(name)
    end
   end

   def self.alphabetical
     self.all.sort_by do | obj |
        obj.name
      end
 end

   def self.new_from_filename (file_name)
   new_song = Song.new
   name_song_arr = file_name.split(" - ")
   song_name = name_song_arr[1].chomp('.mp3')
   song_artist = name_song_arr[0]
   new_song.name = song_name
   new_song.artist_name = song_artist
   new_song
   end

   def self.create_from_filename (file_name)
     self.new_from_filename(file_name).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

end

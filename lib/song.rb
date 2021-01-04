require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    extend Concerns::Findable

    def initialize(name, artist=nil, genre=nil)
        @name = name
        #binding.pry
        if artist != nil
            self.artist=(artist)
        end

        if genre != nil
            self.genre=(genre)
        end
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.count
        @@all.size

    end

    def self.create(name)
        new_song = Song.new(name)
        new_song.save
        new_song
        
    
    end

    def artist=(artist)
        #binding.pry
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)

    end

    def self.find_by_name(song_name)
        self.all.find{|song| song.name == song_name}
    end

   # def self.new_by_name(song_name)
    #    new_song = self.new
     #   new_song.name = song_name
      #  return new_song

    #end

    def self.find_or_create_by_name(name)
       self.find_by_name(name) || self.create(name)

    end

   def self.new_from_filename(filename)
    #binding.pry
    parts = filename.split(" - ")
    artist = Artist.find_or_create_by_name(parts[0])
    name = parts[1]
    genre = Genre.find_or_create_by_name(parts[2].gsub(".mp3", ""))

    Song.new(name, artist, genre)


   end

   def self.create_from_filename(filename)
    #parts = filename.split(" - ")
    #artist = Artist.find_or_create_by_name(parts[0])
    #name = parts[1]
    #genre = Genre.find_or_create_by_name(parts[2].gsub(".mp3", ""))

    #new_song = Song.new(name, artist, genre)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song

   end
      

    #def artist_name
     #   if self.artist
      #    self.artist.name
       # else 
        #  return nil
        #end
          
          
      #end

end
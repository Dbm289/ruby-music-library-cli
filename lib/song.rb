require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist=nil)
        @name = name
        @@all << self
        artist=(artist)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << Song
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

    #def artist_name
     #   if self.artist
      #    self.artist.name
       # else 
        #  return nil
        #end
          
          
      #end

end
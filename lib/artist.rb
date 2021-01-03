require 'pry'
class Artist 

    attr_accessor :name

    @@all = []

    extend Concerns::Findable

    def initialize(name)
        @name = name
        @@all << self
        @songs = []

    end

    def self.all
        @@all

    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << Artist
    end

    def self.create(name)
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
        
    
    end

    def add_song(song)
        if song.artist
            song.artist

        else
            song.artist = self
        end

        if @songs.include?(song)
            nil
        else
            @songs << song
        end
       
    end

    def songs
        @songs
    end

    def genres
        array = songs.map do | song |
            song.genre
            #binding.pry
        end

        array.uniq

        #songs_array = song.genre

        #songs_array.uniq

    end

end
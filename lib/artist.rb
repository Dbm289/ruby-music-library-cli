class Artist 

    attr_accessor :name

    @@all = []

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

end
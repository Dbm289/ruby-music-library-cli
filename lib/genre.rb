class Genre  

    attr_accessor :name

    @@all = []

    extend Concerns::Findable

    def initialize(name)
        @name = name
        @songs = []

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

    def self.create(name)
        new_genre = Genre.new(name)
        new_genre.save
        new_genre
        
    
    end

    def songs
        @songs
    end

    def add_song(song)
        if song.genre
            song.genre

        else
            song.genre = self
        end

        if @songs.include?(song)
            nil
        else
            @songs << song
        end
       
    end

    def artists
        array = songs.map do | song |
            song.artist
            #binding.pry
        end

        array.uniq

        #songs_array = song.genre

        #songs_array.uniq

    end

end
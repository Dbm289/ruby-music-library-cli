require 'pry'
class MusicLibraryController

    attr_accessor :path

    def initialize(path='./db/mp3s')
        @path = path
        import_item = MusicImporter.new(path)
        import_item.import

    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        input = gets.chomp
        while input != "exit"
            if input == "list songs"
                Song.all
            elsif input == "list artists"
                Artist.all
            elsif input == "list genres"
                Genre.all
            elsif input == "list artist"
                artist.song
            elsif input == "list genre"
                genre.song
            elsif input == "play song"
                nil
            end

            input = gets.chomp
        end

        def list_songs
            #binding.pry
            song_list = Song.all
            song_array = song_list.sort
            song_array 



        end

       # while input != "exit"
        #    gets.chomp
        
        #end
            

    end

end
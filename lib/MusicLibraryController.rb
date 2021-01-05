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
        
            song_list = Song.all
            #binding.pry
            #song_names = song_list.sort_by do | song |
                #binding.pry 
            new_array = song_list.sort { | song_1, song_2 | song_1.name <=> song_2.name } #song.name
            new_array.each_with_index do | song, index | 
                puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            end

            #binding.pry
            #end





            #song_array.each do | item |
             #   puts "1. #{item}"

            #end


            
        end

        def list_artists
            artist_list = Artist.all
            #binding.pry
            new_array = artist_list.sort { | artist_1, artist_2 | artist_1.name <=> artist_2.name } #song.name
            new_array.each_with_index do | artist, index | 
                puts "#{index + 1}. #{artist.name}"
                #binding.pry

                    
                #song.artist.name} - #{song.name} - #{song.genre.name}"
            end

        end

        def list_genres
            genre_list = Genre.all
            #binding.pry
            new_array = genre_list.sort { | genre_1, genre_2 | genre_1.name <=> genre_2.name }
            new_array.each_with_index do | genre, index | 
                puts "#{index + 1}. #{genre.name}"
            end

        end

        def list_songs_by_artist
            puts "Please enter the name of an artist:"
            input = gets.chomp
            artist_name = Artist.find_by_name(input)
            if artist_name
            #binding.pry
            new_array = artist_name.songs

            binding.pry

            #binding.pry
            final_array = new_array.sort { | song_1, song_2 | song_1.name <=> song_2.name } #song.name
            final_array.each_with_index do | song, index | 
               puts "#{index + 1}. #{song.name} - #{song.genre.name}"
            end
            else
                nil
            end

        end

       
            

    end

end
class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path

    end

    def files
        Dir.entries(path).reject{|f| f == '.' || f == '..'}

    end

    def import
        #files.each {|f| Song.new_by_filename(f)}
        files.each {|f| Song.create_from_filename(f)}

    end

end
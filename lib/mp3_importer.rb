require 'pry'
class MP3Importer
    attr_accessor :path
    
    @@path_directory = []

    def initialize (test_music_string)
        @path = test_music_string
    end

    def files
        Dir.children(path)
    end

    def import
        self.files.each do |filename|
            Song.new_by_filename(filename)
        end
    end
end
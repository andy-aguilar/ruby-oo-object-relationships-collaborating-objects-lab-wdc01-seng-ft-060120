class Song
    attr_accessor :name, :artist, :genre
    
    @@all = []

    def initialize (name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_array = filename.split (" - ")
        new_song = Song.new(song_array[1])
        new_song.artist = Artist.find_or_create_by_name(song_array[0])
        new_song.genre = song_array[2].delete_suffix('.mp3')
        return new_song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end
end
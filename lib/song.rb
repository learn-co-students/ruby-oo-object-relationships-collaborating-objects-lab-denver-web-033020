class Song
    attr_accessor :name, :artist
    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.new_by_filename(filename)
        song = self.new(filename.split(" - ")[1])
        song.artist_name = (filename.split(" - ")[0])
        song
    end

      def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        # self is this song instance.
        # The current song instance is 
        # being updated(sent in to an artist method) 
        # The self here is "song" in add_song(song)
        # song.artist  = self <- this self is the current 
        #artist instance
        artist.add_song(self)
      end

end

class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        # the song instance passed in,
        # the song's :artist variable is 
        #assigned the current artist instance. 
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        # my original loop had the return new instance happen inside of it, 
        #if trying to go through a nill array, then it won't execute the loop
        self.all.each do |artist|
            if artist.name == name
                return artist
            end
        end
        return self.new(name)
    end

    def print_songs
        Song.all.collect do |song|
            if song.artist == self
                puts song.name
            end
        end
    end



end

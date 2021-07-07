require 'pry'

class Artist
    attr_accessor :name,
                  :song
    @@all = []

    def initialize(name)
        @name= name
        @@all << self
    end 

    def self.all
        @@all 
    end 

    # argument passed is a song instance
      #<Song:0x00007fffe409a4e8 @name="Rock With You">
    # self is an artist instance
    # #<Artist:0x00007fffe409a538 @name="Michael Jackson">
    # give this song instance an artist instance as an attribute artist
    # now you can do a ruby chain.
        #song.artist.name
    def add_song(song)
        song.artist = self
    end 
    
    # From an array of song instances, only pull out
        # song instances that have this artist listed as an attribute
            # song that belong to this artist
    def songs
        Song.all.select{|song| song.artist == self}
    end 

    # you have artist name that is being fed into the class artist from class song
    # upon receiving an artist name, we want to go through our array of artist instances
        # see if the aritst name being fed through has match in our array of artist instances.
    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end 
    
    # when an artist name is fed through from class Song
    # look for the artist name within our array of artist instances
    # if there is a match, return the artist name
    # if not, then instantiate a new artist instance with the name passed through
    # notice the following is a ternary 
    def self.find_or_create_by_name (name)
        self.find(name)? self.find(name): self.new(name)
    end 
    
    
    # use the song method to get the array of all songs with this artist instance
        # [#<Song:0x00007ffff0570038 @artist=#<Artist:0x00007ffff0570088 @name="Michael Jackson">, @name="Dirty Diana">,
 #<Song:0x00007ffff0577f90 @artist=#<Artist:0x00007ffff0570088 @name="Michael Jackson">, @name="Billie Jean">]   
    # then print name of the songs.
    def print_songs
        songs.each {|song| puts song.name}
      end
end

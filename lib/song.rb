require 'pry'
class Song
    attr_accessor :name, 
                  :artist
    @@all = []
    
    def initialize (name)
        @name =name
        @@all << self
    end 
    
    def self.all
        @@all
    end 
 
    #Objective: take in a file name and split into artist and song(title)
        # create a new instance of song
            # give it a song title attribute
                # artist attribute 
#filename "Michael Jackson - Black or White - pop.mp3"
    # split the string by - and set each - - as an element of an array
    # first element will be under variable artist
    # second element will be under variable song
    # create a new song instance with song variable as an attribute
    # to the new song instance, add an artist_name attribute equal to artist variable
    def self.new_by_filename(filename)
        artist,song= filename.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end 
=begin
  #artist_name=
  #accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
  [1] pry(#<Song>)> name
  => "Michael Jackson"
  [2] pry(#<Song>)> self
  => #<Song:0x00007fffc62df348 @artist=#<Artist:0x00007fffc622c8d8 @name="Michael Jackson">, @name="Black or White">
 artist attribute of currnt instance of the song - either create an artist instance with the name if it does not exist, or it it does exist then set the artist instance equal to it. 
 once this current song instance is associated with an artist instance, you also want artist to associate with the song instance. 
 with the current artistst instance, it's asking artist to 
 artist needs to recognize the songs it has, songs need to know they belong to an artist. 
=end
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        binding.pry
    end 
end 
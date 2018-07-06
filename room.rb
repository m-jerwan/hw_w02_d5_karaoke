# note:
# method access_song_by_title returns an whole class song object if found,
# but a string "Song not found" if song is not found.
# Fixed this by when song not found, method returns a song object with
# "No song of this title stored" as a title.
# One method, two diff conditional outputs - that can't be good practice

require_relative ("guest.rb")
require_relative ("song_database.rb")

class Room
  attr_reader :room_status, :room_name

  def initialize(room_name, capacity)
    @room_name = room_name
    @guests_in_room = []

    #FIX: DIFF ROOMS SHOULD HAVE DIFF CAPACITIES AND FEES (CONDITIONAL)
    @capacity = capacity
    @free_spaces = @capacity - @guests_in_room.length  ##LEAVE AS IT IS
    @fee = nil  #on purpose!, by mistake you could charge £0, you cant cahrge £nil

    @songs_database = SongDatabase.new().all_songs  #all rooms start with database of songs
    @room_status = "Open"

  ##------------------BAR:
    # @drinks = ["Beer", "Whiskey", "Water"]
    # @food = ["Crisps", "Nachos", "Chilli"]

  end


###------------------------------guests:
  def check_free_spaces
    return @free_spaces =  @capacity - @guests_in_room.length
  end

  def add_guest(guest, room)
    if guest.can_afford?(room)
      if  @check_free_spaces == 0   ## THiS IS NOT WORKING, WHY??
        @room_status = "Full"
        return "#{room_name} is #{room_status}"
      else
        @guests_in_room << guest
      end
    else
      return "No money"
    end
  end

  def remove_guest(guest)
    @guests_in_room.delete(guest)
  end

###------------------------------songs:
#should they be methods of room or of database called by room?

  def access_song_by_number(song_number)  #method not used
    index_number = song_number - 1
    return @songs_database[index_number]
  end

  def access_song_by_title(song_title)
    for song in @songs_database
      return song if song_title == song.title
    end
      return no_song = Song.new("No song of this title stored", "", "")
  end

  def add_song(title, artist, lyrics)
    song = Song.new(title, artist, lyrics)
    @songs_database << song
  end

  def remove_song(song_title)
    for song in @songs_database
      @songs_database.delete(song) if song_title = song.title
    end
  end
#---------------------------------FEES:

  def room_charge
    return 100 if @capacity >= 10
    return 75 if @capacity >= 5
    return 50 if @capacity >= 1
  end



end

require_relative ("guest.rb")
require_relative ("song_database.rb")
#require_relative ("song.rb")

#disconect as child
#connect through method
#connet methods from song_database



class Room

  def initialize(room_name, capacity)
    @room_name = room_name
    @guests_in_room = []

    #FIX: DIFF ROOMS SHOULD HAVE DIFF CAPACITIES AND FEES (CONDITIONAL)
    @capacity = capacity
    @free_spaces = @capacity - @guests_in_room.length  ##LEAVE AS IT IS
    @fee = 50

    @songs_database = SongDatabase.new()  #all rooms start with database of songs

    #@bar =
  end

  def check_free_spaces
    return @free_spaces =  @capacity - @guests_in_room.length
  end

  def add_guest(guest)
    @guests_in_room << guest
  end

  def remove_guest(guest)
    @guests_in_room.delete(guest)
  end

  def access_song(song_number)
    index_number = song_number - 1
    return @songs_database.songs[index_number]
  end



end

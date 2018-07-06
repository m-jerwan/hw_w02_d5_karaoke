require_relative ("guest.rb")
require_relative ("song_database.rb")
#require_relative ("song.rb")





class Room < SongDatabase

  def initialize(room_name, capacity)
    @room_name = room_name
    @guests_in_room = []

    #FIX: DIFF ROOMS SHOULD HAVE DIFF CAPACITIES AND FEES (CONDITIONAL)
    @capacity = capacity
    @free_spaces = @capacity - @guests_in_room.length  ##LEAVE AS IT IS
    @fee = 50

    @songs = super()  #all rooms start with database init

    #@bar =
  end

  def check_free_spaces
    return @free_spaces
  end

  def add_guest(guest)
    @guests_in_room << guest
    @free_spaces = @capacity - @guests_in_room.length
  end

  def remove_guest(guest)
    @guests_in_room.delete(guest)
    @free_spaces = @capacity - @guests_in_room.length
  end

end

# note:
# method access_song_by_title returns an whole class song object if found,
# but a string "Song not found" if song is not found.
# Fixed this by when song not found, method returns a song object with
# "No song of this title stored" as a title.
# One method, two diff conditional outputs - that can't be good practice


#SOLUTIONs - method can return always a msg or boolion after an action,
#so always returns same type of output - string

require_relative ("guest.rb")
require_relative ("song_database.rb")

class Room
  attr_reader :room_status, :room_name, :drinks, :food

  def initialize(room_name, capacity)
    @room_name = room_name
    @guests_in_room = []

    @capacity = capacity
    @free_spaces = @capacity - @guests_in_room.length  ##LEAVE AS IT IS
    @fee = nil  #on purpose!, by mistake you could charge £0, you cant charge £nil

    @songs_database = SongDatabase.new().all_songs
    #all rooms start with database of songs


    @room_status = "Open"

    ##------------------BAR:
    @beer = {
      price: 5,
    }
    @whiskey = {
      price: 7,
    }
    @water = {
      price: 2,
    }
    @drinks = [@beer, @whiskey, @water]

    @crisps = {
      price: 2,
    }
    @nachos = {
      price: 8,
    }
    @chilli = {
      price: 5,
    }
    @food = [@crisps, @nachos, @chilli]

    #  @customer_tab =
    #we've got all customerts in room in guests in room  array.
    #change that to and array of hashes which are starting with
    #customer name and 0 monies. as spending, we will update this array

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
    @guests_in_room.delete(guest)     #<<<<potential enumaration
  end

  def whois_in_room
    @guests_in_room
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
    return no_song = Song.new("'#{song_title}' is not in the database", "", "")
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


  #---------------------------------BAR:

  def customer_orders_drink(guest, drink)
    for person in @guests_in_room
      if guest.say_name == person.say_name
              guest.tab += @beer[:price]
              return @beer[:price]
      else
         return 0
      end



    end
  end



end

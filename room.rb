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
    @capacity = capacity
    @guests_in_room = []

    @free_spaces = @capacity - @guests_in_room.length  ##LEAVE AS IT IS
    @fee = nil  #on purpose!, by mistake you could charge £0, you cant charge £nil

    @song_database = SongDatabase.new().all_songs
    #all rooms start with database of songs
    @room_status = "Open"

    ##------------------BAR:
    @beer = {
      type: "beer",
      price: 5
    }
    @whiskey = {
      type: "whiskey",
      price: 7
    }
    @water = {
      type: "water",
      price: 2
    }
    @drinks = [@beer, @whiskey, @water]

    @crisps = {
      type: "crisps",
      price: 2
    }
    @nachos = {
      type: "nachos",
      price: 8
    }
    @chilli = {
      type: "chilli",
      price: 5
    }
    @food = [@crisps, @nachos, @chilli]

  end
  #---------------------------------FEES:

  def room_charge
    return 100 if @capacity >= 10
    return 75 if @capacity >= 5
    return 50 if @capacity >= 1
  end


  ###------------------------------guests:
  def check_free_spaces
    return @free_spaces =  @capacity - @guests_in_room.length
  end

  def add_guest(guest, room) #needs to pass ROOM to cant_afford
    return "No money"  if guest.cant_afford?(room) # HOW TO AVOID THAT?
    if  room.check_free_spaces == 0
      @room_status = "#{room_name} room is Full"
      return @room_status
    elsif room.check_free_spaces == 1
      @guests_in_room << guest
      @room_status = "#{room_name} room is now Full"
      return @room_status
    else
      @guests_in_room << guest
      @room_status = "#{room_name} room has #{room.check_free_spaces} spaces left"
      return @room_status
    end
  end

  def remove_guest(guest)
    @guests_in_room.delete(guest)
  end

  def whois_in_room_all_data
    @guests_in_room
  end

  def whois_in_room_names
    guests_in_room_names = []
    @guests_in_room.each {|guest| guests_in_room_names << guest.say_name }
    return guests_in_room_names
  end


  ###------------------------------songs:
  def songs_menu
    songs_menu_screen  =  "*----------------------*\n"
    counter = 1
    @song_database.each { |song|
      songs_menu_screen += " #{counter}. #{song .title} \n"
      counter += 1
    }
    songs_menu_screen += "*----------------------*"
    return songs_menu_screen
  end

  def access_song_by_number(song_number)
    index_number = song_number - 1
    return @song_database[index_number]
  end

  def access_song_by_title(song_title)
    @song_database.each { |song| return song if song_title == song.title }
    return no_song = Song.new("'#{song_title}' is not in the database", "", "")
  end

  def add_song(title, artist, lyrics)
    song = Song.new(title, artist, lyrics)
    @song_database << song
  end

  def remove_song(song_title)
    @song_database.each { |song|
      @song_database.delete(song) if song_title = song.title
    }
  end


  #---------------------------------BAR:

  def customer_orders(guest, what_is_ordered)
    for person in @guests_in_room
      if guest.say_name == person.say_name
        guest.tab += what_is_ordered[:price]
        return what_is_ordered[:price]
      else
        return 0
      end
    end
  end


end

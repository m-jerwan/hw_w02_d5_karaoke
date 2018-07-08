 require_relative ("room.rb")

class Guest

  attr_reader :fav_song
  attr_accessor :tab

  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
    @tab = 0
  end

  def say_name
    return @name
  end

  def can_afford?(room)
    room.room_charge > @money ? false : true
  end

def sing(room, song_no)
  shout = room.access_song_by_number(song_no).lyrics.upcase
  return shout
end


def cheer(room)
   if @fav_song == room.access_song_by_title(@fav_song).title
     return   "Wow, lets sing then!"
   else
     return "Macarena then!"
   end
end

end

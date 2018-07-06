 require_relative ("room.rb")

class Guest

  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
  end


  def check_money
      return @money
  end


def sing(room, song_no)
  shout = room.access_song(song_no).lyrics.upcase
  return shout
end




end

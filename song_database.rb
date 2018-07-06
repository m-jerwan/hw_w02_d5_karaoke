require_relative ("song.rb")

class SongDatabase

  def initialize

    @song_01 = Song.new(
      "I want to break free",
      "Queen",
      "I want to break free,
      I want to break free
      I want to break free from your lies",
      101010110101001101011010)
    @song_02 = Song.new(
        "More than this",
        "Roxy Music",
        "I could feel at the time,
        There was no way of knowing,
        Fallen leaves in the night",
        10101011001011010)
      @songs = [@song_01, @song_02]
      
  end


  def check_song_title
    return @title
  end

  def access_song(song_number)
    index_number = song_number - 1
    return @songs[index_number]
  end



end
require_relative ("song.rb")

class SongDatabase
  attr_reader :all_songs

  def initialize

    @song_01 = Song.new(
      "I want to break free",
      "Queen",
      "I want to break free,
      I want to break free
      I want to break free from your lies")
    @song_02 = Song.new(
        "More than this",
        "Roxy Music",
        "I could feel at the time,
        There was no way of knowing,
        Fallen leaves in the night")

      @all_songs = [@song_01, @song_02]

  end

end

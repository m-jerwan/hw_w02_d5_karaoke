
class Song

attr_reader :title, :artist, :lyrics, :music

  def initialize(title, artist, lyrics)
    @title = title
    @aritst = artist
    @lyrics = lyrics
  end


  def check_song_title
    return @title
  end




end

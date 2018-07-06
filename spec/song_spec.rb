require "minitest/autorun"
require_relative "../song.rb"


class TestGuest < MiniTest::Test

  def setup
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

  end

  def test_check_song_title

    expected = "More than this"
    assert_equal(expected, @song_02.check_song_title)

  end



end

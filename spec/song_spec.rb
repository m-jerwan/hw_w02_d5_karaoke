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
  end

  def test_check_song_title
    expected = "I want to break free"
    assert_equal(expected, @song_01.title)
  end



end

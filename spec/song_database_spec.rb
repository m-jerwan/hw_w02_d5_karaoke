
require "minitest/autorun"
require_relative "../song_database.rb"
# require('pry')


class TestSongDatabase < MiniTest::Test

  def setup
    @test_database = SongDatabase.new
  end

  def test_access_song_1
    expected = "More than this"
    assert_equal(expected, @test_database.access_song(2).check_song_title)
  end



end

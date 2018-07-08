require "minitest/autorun"
require_relative "../guest.rb"
require('pry') #binding.pry

class TestGuest < MiniTest::Test


  def setup
    @guest_01 = Guest.new("Bill Murray", 300, "More than this")
    @guest_02 = Guest.new("Scarlett Johansson", 20, "Brass in pocket")
    @guest_03 = Guest.new("Fumihiro Hayashi", 100, "God save the Queen")

    @mercury = Room.new("Freedie Mercury", 10)
  end


  def test_sing
    expected = @guest_01.sing(@mercury, 1)
    actual = @mercury.access_song_by_number(1).lyrics.upcase
    assert_equal(expected, actual)
  end

  def test_can_afford?
    actual = @guest_02.cant_afford?(@mercury)
    assert_equal(true, actual)
  end

def test_cheer__have_song
  actual = @guest_01.cheer(@mercury)
  assert_equal("Wow, lets sing then!", actual)
end

def test_cheer__no_fav_song
  actual = @guest_02.cheer(@mercury)
  assert_equal("Great...Macarena then!", actual)
end



end

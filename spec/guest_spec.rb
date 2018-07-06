require "minitest/autorun"
require_relative "../guest.rb"


class TestGuest < MiniTest::Test


  def setup
    @guest_01 = Guest.new("Bill Murray", 100, "More Than This")
    @guest_02 = Guest.new("Scarlett Johansson", 20, "Brass in Pocket")
    @guest_03 = Guest.new("Fumihiro Hayashi", 30, "God Save The Queen")

    @mercury = Room.new("Freedie Mercury", 10)
  end

  def test_check_money
    assert_equal(30, @guest_03.check_money)
  end

  def test_sing
    expected = @guest_01.sing(@mercury, 1)
    actual = @mercury.access_song(1).lyrics.upcase
    assert_equal(expected, actual)
  end


end

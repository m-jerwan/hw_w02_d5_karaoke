require ("minitest/autorun")
require_relative ("../room.rb")
require('pry')

class TestRoom < MiniTest::Test


  def setup
    @guest_01 = Guest.new("Bill Murray", 100, "More Than This")
    @guest_02 = Guest.new("Scarlett Johansson", 20, "Brass in Pocket")
    # @guest_03 = Guest.new("Fumihiro Hayashi", 30, "God Save The Queen")

    @mercury = Room.new("Freedie Mercury", 10)
    @biber = Room.new("Justin Biber", 10)
  end

  def test_check_free_spaces
    assert_equal(10, @mercury.check_free_spaces)
  end

  def test_add_guest
    @mercury.add_guest(@guest_01)
    @mercury.add_guest(@guest_02)
    assert_equal(8, @mercury.check_free_spaces)
  end

    def test_remove_guest
      @mercury.add_guest(@guest_01)
      @mercury.add_guest(@guest_02)
      @mercury.remove_guest(@guest_02)
      assert_equal(9, @mercury.check_free_spaces)

  end

  def test_access_song  #checking proper conection to database
    actual = @mercury.access_song(2).check_song_title
    expected = "More than this"
    assert_equal(expected, actual)
  end


end

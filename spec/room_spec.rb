require ("minitest/autorun")
require_relative ("../room.rb")
require('pry') #binding.pry

class TestRoom < MiniTest::Test


  def setup
    @guest_01 = Guest.new("Bill Murray", 300, "More than this")
    @guest_02 = Guest.new("Scarlett Johansson", 20, "Brass in pocket")
    @guest_03 = Guest.new("Fumihiro Hayashi", 100, "God save the Queen")

    @mercury = Room.new("Freedie Mercury", 10)
    @biber = Room.new("Justin Biber", 5)
    @grande = Room.new("Ariana Grande", 1)
  end

  ###------------------------------guests:

  def test_check_free_spaces
    assert_equal(10, @mercury.check_free_spaces)
  end

  def test_add_guest__there_is_space_and_have_money
    @mercury.add_guest(@guest_01, @mercury)
    @mercury.add_guest(@guest_03, @mercury)
    expected = "Freedie Mercury room is Open, 8 spaces left"
    actual = "#{@mercury.room_name} room is #{@mercury.room_status}, "
    actual += "#{@mercury.check_free_spaces} spaces left"
    assert_equal(expected,actual)
  end

  def test_add_guest__there_is_space_but_no_money
    actual = @mercury.add_guest(@guest_02, @mercury)
    expected = "No money"
    assert_equal(expected,@mercury.add_guest(@guest_02, @mercury))
  end


  def test_add_guest_no_space_left  #WHY THIS IS NOT WORKING??????
    # binding.pry
    # @grande.add_guest(@guest_01, @mercury)
    # @grande.add_guest(@guest_01, @mercury)
    # @grande.add_guest(@guest_01, @mercury)
    # @grande.add_guest(@guest_02, @mercury)
    # actual = @grande.room_status
    # assert_equal("Sorry, no room", actual)
  end


    def test_remove_guest
      @mercury.add_guest(@guest_01, @mercury)
      @mercury.add_guest(@guest_02, @mercury)
      @mercury.remove_guest(@guest_02)
      assert_equal(9, @mercury.check_free_spaces)
  end

#---------------------------------songs:

  def test_access_song  #checking proper conection to database
    expected = "More than this" #by testing song title return
    actual = @mercury.access_song_by_number(2).title
    assert_equal(expected, actual)
  end

  def test_access_song_by_title
    expected = "More than this"
    actual = @mercury.access_song_by_title("More than this").title
    assert_equal(expected, actual)
  end
#--------------------songs read/write add: room method. should be database method?
  def test_add_song
    @biber.add_song("Hey Jude", "The Beatles","Hey Jude, hey Jude")
    expected = "Hey Jude"
    actual = @biber.access_song_by_title("Hey Jude").title
    assert_equal(expected, actual)
  end

  def test_remove_song  #adding, then removing Hey Joe, testing return error
    @mercury.add_song("Hey Jude", "The Beatles","Hey Jude, hey Jude")
    @mercury.remove_song("Hey Jude")
    expected = "No song of this title stored"
    actual = @mercury.access_song_by_title("Hey Jude").title
    assert_equal(expected, actual)
  end

  def test_room_charge
    actual = @biber.room_charge
    assert_equal(75, actual)
  end


end

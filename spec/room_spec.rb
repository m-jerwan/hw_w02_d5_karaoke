require ("minitest/autorun")
require_relative ("../room.rb")
require('pry') #binding.pry

class TestRoom < MiniTest::Test


  def setup
    @guest_01 = Guest.new("Bill Murray", 300, "More than this")
    @guest_02 = Guest.new("Scarlett Johansson", 20, "Brass in pocket")
    @guest_03 = Guest.new("Fumihiro Hayashi", 100, "God save the Queen")

    @mercury = Room.new("Freedie Mercury", 10)
    @biber = Room.new("Justin Biber", 1)
    @grande = Room.new("Ariana Grande", 5)
  end

##-----------------------------------room:

  def test_room_charge_rates
    actual = @biber.room_charge
    assert_equal(50, actual)
  end

  ###------------------------------guests:

  def test_check_free_spaces
    assert_equal(10, @mercury.check_free_spaces)
  end

  def test_add_guest__there_is_space_and_have_money
    @mercury.add_guest(@guest_01, @mercury)
    @mercury.add_guest(@guest_03, @mercury)
    expected = "Freedie Mercury room has 8 spaces left"
    assert_equal(expected, @mercury.room_status)
  end

  def test_add_guest__there_is_space_but_no_money
    actual = @mercury.add_guest(@guest_02, @mercury)
    expected = "No money"
    assert_equal(expected,@mercury.add_guest(@guest_02, @mercury))
  end


  def test_add_guest_no_space_left
    @biber.add_guest(@guest_01, @biber)
    @biber.add_guest(@guest_01, @biber)
    @biber.add_guest(@guest_01, @biber)
    actual = @biber.room_status
    assert_equal("Justin Biber room is Full", actual)
  end

  def test_remove_guest
    @mercury.add_guest(@guest_01, @mercury)
    @mercury.add_guest(@guest_02, @mercury)
    @mercury.remove_guest(@guest_02)
    assert_equal(9, @mercury.check_free_spaces)
  end


  def test_whos_in_room_all_data # getting back all guest data
    @mercury.add_guest(@guest_01, @mercury)
    expected = "Bill Murray"
    actual = @mercury.whois_in_room_all_data[0].say_name
    assert_equal(expected, actual)
  end

  def test_whos_in_room_names #getting back names
    @grande.add_guest(@guest_01, @grande)
    @grande.add_guest(@guest_03, @grande)
    expected = ["Bill Murray", "Fumihiro Hayashi"]
    actual = @grande.whois_in_room_names
    assert_equal(expected, actual)
  end

  #---------------------------------songs:

  def test_show_songs_menu
    expected = "*"  #have to test first letter as difficult testing all text
    assert_equal(expected, @mercury.songs_menu[0])    #<<
  end

  def test_access_song    #accesing by song No
    expected = "More than this"
    actual = @mercury.access_song_by_number(2).title
    assert_equal(expected, actual)
  end

  def test_access_song_by_title  #accesing by title
    expected = "More than this"
    actual = @mercury.access_song_by_title("More than this").title
    assert_equal(expected, actual)
  end

  def test_add_song
    @biber.add_song("Hey Jude", "The Beatles","Hey Jude, hey Jude")
    expected = "Hey Jude"
    actual = @biber.access_song_by_title("Hey Jude").title
    assert_equal(expected, actual)
  end

  def test_remove_song__return_error
    expected = "'The Beach' is not in the database"
    actual = @mercury.access_song_by_title("The Beach").title
    assert_equal(expected, actual)
  end


  ##------------------BAR:

  def test_check_drink_price__beer
    assert_equal(5, @mercury.drinks[0][:price])
  end

  def test_customer_orders__beer
    @mercury.add_guest(@guest_01, @mercury)
    @mercury.customer_orders(@guest_01, @mercury.drinks[0])
    assert_equal(5, @guest_01.tab)
  end

  def test_customer_orders_drink__beer__no_customer_like_this
    @mercury.add_guest(@guest_01, @mercury)
    actual = @mercury.customer_orders(@guest_02, @mercury.drinks[0])
    assert_equal(0, actual)
  end

  def test_check_tab_guest_pay
    @mercury.add_guest(@guest_01, @mercury)
    @mercury.customer_orders(@guest_01, @mercury.drinks[0])
    @mercury.customer_orders(@guest_01, @mercury.drinks[0])
    @mercury.customer_orders(@guest_01, @mercury.drinks[0])
    @mercury.customer_orders(@guest_01, @mercury.drinks[0])
    assert_equal(20, @guest_01.tab)
  end






end

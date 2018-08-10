require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")


class TestRoom < Minitest::Test

  def setup

    @song1 = Song.new("The End")
    @guest1 = Guest.new("Guest1", 100, @song1)
    @guest2 = Guest.new("Guest2", 100, @song1)
    @guest3 = Guest.new("Guest3", 100, @song1)
    @guest4 = Guest.new("Guest4", 10, @song1)
    @room1 = Room.new(15, 1000, 2)

  end


  def test_guests
    assert_equal([], @room1.guests)
  end

  def test_songs
    assert_equal([], @room1.songs)
  end

  def test_entry_fee
    assert_equal(15, @room1.entry_fee)
  end

  def test_bar_tab
    assert_equal([], @room1.bar_tab)
  end

  def test_cash
    assert_equal(1000, @room1.cash)
  end

  def test_capacity
    assert_equal(2, @room1.capacity)
  end

  def test_check_in_guest
    @room1.check_in_guest(@guest1)
    assert_equal([@guest1], @room1.guests)
  end

  def test_check_out_guest
    @room1.check_in_guest(@guest1)
    @room1.check_out_guest(@guest1)
    assert_equal([], @room1.guests)
  end

  def test_add_song
    @room1.add_song(@song1)
    assert_equal([@song1], @room1.songs)
  end

  def test_remove_song
    @room1.add_song(@song1)
    @room1.remove_song(@song1)
    assert_equal([], @room1.songs)
  end

  def test_at_capacity__true
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    assert_equal(true, @room1.at_capacity)
  end

  def test_at_capacity__false
    @room1.check_in_guest(@guest1)
    assert_equal(false, @room1.at_capacity)
  end

  def test_check_in_guest__at_capacity_no_change
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    assert_equal([@guest1, @guest2], @room1.guests)
  end

  def test_check_in_guest__not_enough_money
    @room1.check_in_guest(@guest4)
    assert_equal([], @room1.guests)
  end

  def test_check_in_guest__money_transferred
    room_before = @room1.cash
    guest_before = @guest1.money
    fee = @room1.entry_fee
    @room1.check_in_guest(@guest1)
    assert_equal(room_before + fee, @room1.cash)
    assert_equal(guest_before - fee, @guest1.money)
  end


end

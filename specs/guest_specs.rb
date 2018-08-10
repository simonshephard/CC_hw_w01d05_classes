require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")

class TestGuest < Minitest::Test

  def setup
    @song1 = Song.new("The End")
    @guest1 = Guest.new("Guest1", 100, @song1)
    @room1 = Room.new(15, 1000, 10)
  end


  def test_name
    assert_equal("Guest1", @guest1.name)
  end

  def test_money
    assert_equal(100, @guest1.money)
  end

  def test_song
    assert_equal(@song1, @guest1.song)
  end

  def test_reduce_money
    @guest1.reduce_money(20)
    assert_equal(80, @guest1.money)
  end

  def test_room_has_favourite_song
    @room1.add_song(@song1)
    assert_equal("WhooHoo!", @guest1.room_has_favourite_song(@room1))
  end

end

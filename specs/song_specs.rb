require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")


class TestSong < Minitest::Test


  def setup
    @song1 = Song.new("The End")
  end


  def test_name
    assert_equal("The End", @song1.name)
  end


end

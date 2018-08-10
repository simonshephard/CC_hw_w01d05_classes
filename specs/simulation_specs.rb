require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")
require_relative("../simulation.rb")


class TestSimulation < Minitest::Test


  def setup

    @names = [
      "Ben",
      "Chloe",
      "Cristian",
      "Filip",
      "German",
      "Simon",
      "Alan",
      "Foteini",
      "James",
      "Jesse",
      "Matt",
      "Mike B",
      "Sandy",
      "Keith",
      "Colin",
      "Alison",
      "Alvaro",
      "Callum",
      "Craig",
      "Laura",
      "Michael",
      "Sharon"
    ]

    @money = [1, 2, 3, 5, 10, 12, 15, 20, 25, 30]

    @songs = [
      "Welcome to the Jungle by Guns N' Roses",
      "Give It Up by KC and the Sunshine Band",
      "More Than A Feeling by Boston",
      "The End by The Doors",
      "Riders on the Storm by The Doors",
      "Needle and the Damage Done by Neil Young",
      "Harvest by Neil Young",
      "Up on Cripple Creek by The Band",
      "The Night they Drove Old Dixie Down by The Band",
      "I Can Help by Billy Swan",
      "8 Miles High by The Byrds",
      "Hey Jude by the Beatles",
      "Teach Your Children by Crosby, Stills, and Nash",
      "Girls Just Wanna Have Fun by Cyndi Lauper",
      "Uptown Funk by Bruno Mars",
      "All Right Now by Free"
    ]

    @entry_fee = 5
    @start_cash = 1000

    @sleep_time = 0

    @responses = [
      "Killed it!!!!",
      "Awesome!",
      "Who knew they had a voice like that!",
      "Just OK! Meh!",
      "Maybe not!",
      "Oh dear!!",
      "It was horrible - look away!"
    ]

    @capacity = 15

    @simulation = Simulation.new(@names, @money, @songs, @entry_fee, @start_cash, @sleep_time, @responses, @capacity)

  end

  def test_names
    assert_equal(@names, @simulation.names)
  end

  def test_money
    assert_equal(@money, @simulation.money)
  end

  def test_songs
    assert_equal(@songs, @simulation.songs)
  end

  def test_entry_fee
    assert_equal(@entry_fee, @simulation.entry_fee)
  end

  def test_start_cash
    assert_equal(@start_cash, @simulation.start_cash)
  end

  def test_sleep_time
    assert_equal(@sleep_time, @simulation.sleep_time)
  end

  def test_responses
    assert_equal(@responses, @simulation.responses)
  end

  def test_capacity
    assert_equal(@capacity, @simulation.capacity)
  end

  def test_run
    assert_equal(true, @simulation.run)
  end


end

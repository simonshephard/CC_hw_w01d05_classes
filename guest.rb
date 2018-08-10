class Guest

  attr_reader :name, :money, :song

  def initialize(name, money, song)
    @name = name
    @money = money
    @song = song
  end

  def reduce_money(amount)
    @money -= amount
  end

  def room_has_favourite_song(room)
    if room.songs.include?(@song)
      return "WhooHoo! They've already got the song!"
    else
      return "They don't have the song but they'll add it to the database anyway!"
    end
  end

end

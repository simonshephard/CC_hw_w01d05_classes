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
    return "WhooHoo!" if room.songs.include?(@song)
  end

end

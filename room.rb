class Room

  attr_reader :entry_fee, :cash, :capacity, :guests, :songs, :bar_tab

  def initialize(entry_fee, cash, capacity)
    @entry_fee = entry_fee
    @cash = cash
    @capacity = capacity
    @guests = []
    @songs = []
    @bar_tab = []
  end

  def check_in_guest(guest)
    return "The room is full!" if !at_capacity
    if guest.money < @entry_fee
      return "Not Refused entry - try again later!!"
    else
      @guests << guest
      guest.reduce_money(@entry_fee)
      @cash += @entry_fee
      return "They got in!"
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end

  def remove_song(song)
    @songs.delete(song)
  end

  def at_capacity
    @guests.length == @capacity
  end


end

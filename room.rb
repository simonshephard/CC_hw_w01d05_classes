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
    if self.at_capacity? || !guest_enough_money?(guest)
      return
    else
      @guests << guest
      guest.reduce_money(@entry_fee)
      @cash += @entry_fee
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest) if self.is_guest_by_name?(guest.name)
  end

  def add_song(song)
    @songs << song
  end

  def remove_song(song)
    @songs.delete(song)
  end

  def at_capacity?
    @guests.length == @capacity
  end

  def guest_enough_money?(guest)
    guest.money >= @entry_fee
  end

  def is_guest_by_name?(name_to_check)
    @guests.map{|guest| guest.name}.include?(name_to_check)
  end

end

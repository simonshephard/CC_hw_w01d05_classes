class Simulation

  attr_reader :names, :money, :songs, :entry_fee, :start_cash, :sleep_time, :responses, :capacity

  def initialize(names, money, songs, entry_fee, start_cash, sleep_time, responses, capacity)
    @names = names
    @money = money
    @songs = songs
    @entry_fee = entry_fee
    @start_cash = start_cash
    @sleep_time = sleep_time
    @responses = responses
    @capacity = capacity
  end

  def run

    room = Room.new(@entry_fee, @start_cash, @capacity)

    # start
    sleep(@sleep_time)
    print "\n"

    # loop
    until room.at_capacity? do #or everyone sung

      sleep(@sleep_time)
      print "\n"

      person = Guest.new(@names[Random.rand(@names.length)], @money[Random.rand(@money.length)], @songs[Random.rand(@songs.length)])

      if room.is_guest_by_name?(person.name)
        print "#{person.name} tries to sing again!! Let someone else have a go!\n"
        sleep(@sleep_time)
        print "\n"
        print "#{room.guests.map{|guest| guest.name}.join(", ")} are in the room! #{room.guests.length} out of capacity #{room.capacity}.\n"
        sleep(@sleep_time)
        print "\n"
        next
      end

      if !room.guest_enough_money?(person)
        print "#{person.name} tries to enter the karaoke room but doesn't have enough money!\n"
        sleep(@sleep_time)
        print "\n"
        next
      end

      room.check_in_guest(person)
      print "#{person.name} checks into the karaoke room and wants to sing '#{person.song}'\n"
      sleep(@sleep_time)
      print "\n"
      if person.room_has_favourite_song(room)
        print "Room already has the song. #{person.room_has_favourite_song(room)}\n"
        sleep(@sleep_time)
        print "\n"
      else
        room.add_song(person.song)
        print "Adding song to the room.\n"
        sleep(@sleep_time)
        print "\n"
      end

      print "Singing now!\n"
      sleep(@sleep_time)
      print "\n"

      print "#{@responses[Random.rand(@responses.length)]}\n"
      sleep(@sleep_time)
      print "\n"

      if room.guests.length > 0 && Random.rand(4) == 3
        room.check_out_guest(room.guests[Random.rand(room.guests.length)])
        print "#{person.name} checks out of the room. Had enough! For now!\n"
        sleep(@sleep_time)
        print "\n"
      end

    end

    print "KARAOKE ROOM IS AT CAPACITY! NO MORE IN!\n"
    print "#{@names.reject{|name| room.guests.map{|guest| guest.name}.include?(name)}.join(", ")} were left out in the cold!\n"
    print "The room made £#{room.cash - @start_cash} from entry fees.\n"

    return true

  end

end

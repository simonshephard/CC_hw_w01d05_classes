require_relative("./room.rb")
require_relative("./guest.rb")
require_relative("./song.rb")

names = [
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

money = [1, 2, 3, 5, 10, 12, 15, 20, 25, 30]

songs = [
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

entry_fee = 5
start_cash = 1000

sleep_time = 0.75

responses = [
  "Killed it!!!!",
  "Awesome!",
  "Who knew they had a voice like that!",
  "Just OK! Meh!",
  "Maybe not!",
  "Oh dear!!",
  "It was horrible - look away!"
]

room = Room.new(entry_fee, start_cash, 15)

# start
sleep(sleep_time)
print "\n"

# loop
until room.at_capacity? do #or everyone sung

  sleep(sleep_time)
  print "\n"

  person = Guest.new(names[Random.rand(names.length)], money[Random.rand(money.length)], songs[Random.rand(songs.length)])

  if room.is_guest_by_name?(person.name)
    print "#{person.name} tries to sing again!! Let someone else have a go!\n"
    sleep(sleep_time)
    print "\n"
    print "#{room.guests.map{|guest| guest.name}.join(", ")} are in the room! #{room.guests.length} out of capacity #{room.capacity}.\n"
    sleep(sleep_time)
    print "\n"
    next
  end

  if !room.guest_enough_money?(person)
    print "#{person.name} tries to enter the karaoke room but doesn't have enough money!\n"
    sleep(sleep_time)
    print "\n"
    next
  end

  room.check_in_guest(person)
  print "#{person.name} checks into the karaoke room and wants to sing '#{person.song}'\n"
  sleep(sleep_time)
  print "\n"
  if person.room_has_favourite_song(room)
    print "Room already has the song. #{person.room_has_favourite_song(room)}\n"
    sleep(sleep_time)
    print "\n"
  else
    room.add_song(person.song)
    print "Adding song to the room.\n"
    sleep(sleep_time)
    print "\n"
  end

  print "Singing now!\n"
  sleep(sleep_time)
  print "\n"

  print "#{responses[Random.rand(responses.length)]}\n"
  sleep(sleep_time)
  print "\n"

  if room.guests.length > 0 && Random.rand(4) == 3
    room.check_out_guest(room.guests[Random.rand(room.guests.length)])
    print "#{person.name} checks out of the room. Had enough! For now!\n"
    sleep(sleep_time)
    print "\n"
  end

end

print "KARAOKE ROOM IS AT CAPACITY! NO MORE IN!\n"
print "#{names.reject{|name| room.guests.map{|guest| guest.name}.include?(name)}.join(", ")} were left out in the cold!\n"
print "The room made £#{room.cash - start_cash} from entry fees.\n"

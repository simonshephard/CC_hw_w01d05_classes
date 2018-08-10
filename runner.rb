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

money = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10
]

songs = [
  "The End (The Doors)",
  "Riders on the Storm (The Doors)",
  "Needle and the Damage Done (Neil Young)",
  "Harvest (Neil Young)",
  "Up on Cripple Creek (The Band)",
  "The Night they Drove Old Dixie Down (The Band)",
  "I Can Help (Billy Swan)",
  "8 Miles High (The Byrds)",
  "Teach Your Children (Crosby, Stills, and Nash)",
]

entry_fee = 5

responses = [
  "They killed it!!",
  "It was horrible - look away!",
  "Just OK! Meh!"
]

sung = []

#need delay and clear screen??

room = Room.new(entry_fee, 100, 15)

#until room.at_capacity

person = Guest.new(names[1+Random.rand(names.length)], money[1+Random.rand(money.length)], songs[1+Random.rand(songs.length)])
p "#{person.name} approaches the room and wants to sing '#{person.song}'"
p room.check_in_guest(person)
p person.room_has_favourite_song(room)

# try to get in the karaoke room to sing? - not sufficient money / full / enter
# *report
# *delay
# if in then favourite song? - no, then add, yes then woohoo and sing song
# *report
# *delay
# **loop**
# *report End
# who cant get in

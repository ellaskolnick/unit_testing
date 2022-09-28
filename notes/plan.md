```ruby

#INTEGRATION

#1
music_library = MusicLibrary.new
track = Track.new("Watermelon Sugar", "Harry Styles")
music_library.add(track)
music_library.all # => [track]

#2
music_library = MusicLibrary.new
track = Track.new("All Too Well", "Taylor Swift")
track2 = Track.new("Emotional Bruises", "Madison Beer")
music_library.add(track)
music_library.add(track2)
music_library.all # => [track, track2]

#3
music_library = MusicLibrary.new
track = Track.new("Numb Little Bug", "Em Beihold")
track2 = Track.new("Love Of My Life", "Harry Styles")
music_library.add(track)
music_library.add(track2)
music_library.search("numb") # => [track]

#4
music_library = MusicLibrary.new
track = Track.new("Numb Little Bug", "Em Beihold")
track2 = Track.new("Love Of My Life", "Harry Styles")
track3 = Track.new("Love Story", "Taylor Swift")
track4 = Track.new("Another Love", "Tom Odell")
music_library.add(track)
music_library.add(track2)
music_library.add(track3)
music_library.add(track4)
music_library.search("Love") # => [track2, track3, track4]

#5
music_library = MusicLibrary.new
track = Track.new("Good 4 You", "Olivia Rodrigo")
track2 = Track.new("Love Of My Life", "Harry Styles")
track3 = Track.new("Love Story", "Taylor Swift")
track4 = Track.new("Olivia", "One Direction")
track5 = Track.new("Sociopath", "Olivia Obrien")
music_library.add(track)
music_library.add(track2)
music_library.add(track3)
music_library.add(track4)
music_library.add(track5)
music_library.search("Olivia") # => [track, track4, track5]

#6
music_library = MusicLibrary.new
track = Track.new("Body", "Ella Henderson")
track2 = Track.new("Love Of My Life", "Harry Styles")
track3 = Track.new("nothing else i could do", "ella jane")
music_library.add(track)
music_library.add(track2)
music_library.add(track3)
music_library.search("ella") # => [track, track3]

#7
music_library = MusicLibrary.new
track = Track.new("7PM", "Lizzy McAlpine")
track2 = Track.new("Falling For Boys", "Julia Michaels")
music_library.add(track)
music_library.add(track2)
music_library.search("love") # => nil

#UNIT
#TRACK

#1
track = Track.new("Love Of My Life", "Harry Styles")
track.title # => "Love Of My Life"

#2
track = Track.new("Love Of My Life", "Harry Styles")
track.artist # => "Harry Styles"

#3
track = Track.new("Love Of My Life", "Harry Styles")
track.matches?("love") # => true

#4
track = Track.new("Love Of My Life", "Harry Styles")
track.matches?("Harry") # => true

#5
track = Track.new("Love Of My Life", "Harry Styles")
track.matches?("hi") # => false

#MUSIC LIBRARY

#1
music_library = MusicLibrary.new
track = double :track
music_library.add(track)
music_library.all # => [track]

#2
music_library = MusicLibrary.new
track = double :track
track2 = double :track
music_library.add(track)
music_library.add(track2)
music_library.all # => [track, track2]

#3
music_library = MusicLibrary.new
track = double :track, matches?: true
track2 = double :track, , matches?: false
music_library.add(track)
music_library.add(track2)
music_library.search("numb") # => [track]

#4
music_library = MusicLibrary.new
track = double :track, matches?: true
track2 = double :track, matches?: false
track3 = double :track, matches?: true
track4 = double :track, matches?: true
music_library.add(track)
music_library.add(track2)
music_library.add(track3)
music_library.add(track4)
music_library.search("Love") # => [track, track3, track4]

#5
music_library = MusicLibrary.new
music_library.all # => "Music Library is empty"

#6
music_library = MusicLibrary.new
music_libray.search("love") # => "Music Library is empty"

#7
music_library = MusicLibrary.new
track = double :track, matches?: false
track2 = double :track, matches?: false
music_library.add(track)
music_library.add(track2)
music_library.search("love") # => nil

```

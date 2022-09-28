require 'music_library'
require 'track'

RSpec.describe "Music Library Intergration" do
  context "when there is one track" do
    it "returns that one track" do
      music_library = MusicLibrary.new
      track = Track.new("Watermelon Sugar", "Harry Styles")
      music_library.add(track)
      expect(music_library.all).to eq [track]
    end
  end

  context "when there are many track" do
    it "returns all the tracks" do
      music_library = MusicLibrary.new
      track = Track.new("All Too Well", "Taylor Swift")
      track2 = Track.new("Emotional Bruises", "Madison Beer")
      music_library.add(track)
      music_library.add(track2)
      expect(music_library.all).to eq [track, track2]
    end
  end

  context "when one track's title matches the search" do
    it "returns that track" do
      music_library = MusicLibrary.new
      track = Track.new("Numb Little Bug", "Em Beihold")
      track2 = Track.new("Love Of My Life", "Harry Styles")
      music_library.add(track)
      music_library.add(track2)
      expect(music_library.search("numb")).to eq [track]
    end
  end

  context "when multiple tracks title's match the search" do
    it "returns all the matching track" do
      music_library = MusicLibrary.new
      track = Track.new("Numb Little Bug", "Em Beihold")
      track2 = Track.new("Love Of My Life", "Harry Styles")
      track3 = Track.new("Love Story", "Taylor Swift")
      track4 = Track.new("Another Love", "Tom Odell")
      music_library.add(track)
      music_library.add(track2)
      music_library.add(track3)
      music_library.add(track4)
      expect(music_library.search("Love")).to eq [track2, track3, track4]
    end
  end

  context "when multiple tracks artist's match the search" do
    it "returns all the matching track" do
      music_library = MusicLibrary.new
      track = Track.new("Body", "Ella Henderson")
      track2 = Track.new("Love Of My Life", "Harry Styles")
      track3 = Track.new("nothing else i could do", "ella jane")
      music_library.add(track)
      music_library.add(track2)
      music_library.add(track3)
      expect(music_library.search("ella")).to eq [track, track3]
    end
  end

  context "when multiple tracks title's or artist's match the search" do
    it "returns all the matching track" do
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
      expect(music_library.search("Olivia")).to eq [track, track4, track5]
    end
  end

  context "no tracks match the keyword" do
    it "returns empty array" do
      music_library = MusicLibrary.new
      track = Track.new("7PM", "Lizzy McAlpine")
      track2 = Track.new("Falling For Boys", "Julia Michaels")
      music_library.add(track)
      music_library.add(track2)
      expect(music_library.search("love")).to eq []
    end
  end
end

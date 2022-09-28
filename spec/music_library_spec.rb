require 'music_library'

RSpec.describe MusicLibrary do
  context "when there is one track" do
    it "returns that one track" do
      music_library = MusicLibrary.new
      track = double :track
      music_library.add(track)
      expect(music_library.all).to eq [track]
    end
  end

  context "when there are many track" do
    it "returns all the tracks" do
      music_library = MusicLibrary.new
      track = double :track
      track2 = double :track
      music_library.add(track)
      music_library.add(track2)
      expect(music_library.all).to eq [track, track2]
    end
  end

  context "when one thing matches the search" do
    it "returns that track" do
      music_library = MusicLibrary.new
      track = double :track, matches?: true
      track2 = double :track, matches?: false
      music_library.add(track)
      music_library.add(track2)
      expect(music_library.search("numb")).to eq [track]
    end
  end

  context "when multiple tracks title's or artist's match the search" do
    it "returns all the matching track" do
      music_library = MusicLibrary.new
      track = double :track, matches?: true
      track2 = double :track, matches?: false
      track3 = double :track, matches?: true
      track4 = double :track, matches?: true
      music_library.add(track)
      music_library.add(track2)
      music_library.add(track3)
      music_library.add(track4)
      expect(music_library.search("Love")).to eq [track, track3, track4]
    end
  end

  context "no tracks in music library" do
    it "fails" do
      music_library = MusicLibrary.new
      expect{ music_library.all }.to raise_error "Music Library is empty"
    end

    it "fails" do
      music_library = MusicLibrary.new
      expect{ music_library.search("love") }.to raise_error "Music Library is empty"
    end
  end

  context "no tracks match the keyword" do
    it "returns empty array" do
      music_library = MusicLibrary.new
      track = double :track, matches?: false
      track2 = double :track, matches?: false
      music_library.add(track)
      music_library.add(track2)
      expect(music_library.search("love")).to eq []
    end
  end
end

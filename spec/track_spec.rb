require 'track'

RSpec.describe Track do
  context "when has a title and an artist" do
    it "returns the title" do
      track = Track.new("Love Of My Life", "Harry Styles")
      expect(track.title).to eq "Love Of My Life"
    end

    it "returns the artist" do
      track = Track.new("Love Of My Life", "Harry Styles")
      expect(track.artist).to eq "Harry Styles"
    end
  end

  context "when the keyword matches a title of a track" do
    it "returns true" do
      track = Track.new("Love Of My Life", "Harry Styles")
      expect(track.matches?("love")).to eq true
    end
  end

  context "when the keyword matches an artist of a track" do
    it "returns true" do
      track = Track.new("Love Of My Life", "Harry Styles")
      expect(track.matches?("Harry")).to eq true
    end
  end

  context "when the keyword doesn't match a track" do
    it "returns false" do
      track = Track.new("Love Of My Life", "Harry Styles")
      expect(track.matches?("hi")).to eq false
    end
  end
end

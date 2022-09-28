class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track) # track is an instance of Track
    @tracks << track
  end

  def all
    tracks?
    @tracks
  end

  def search(keyword) # keyword is a string
    tracks?
    @tracks.select { |track| track.matches?(keyword) }
  end

  private

  def tracks?
    fail "Music Library is empty" if @tracks.empty?
  end
end

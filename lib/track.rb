class Track
  attr_reader :title, :artist

  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    if matches_title?(keyword) || matches_artist?(keyword)
      true
    else
      false
    end
  end

  private

  def matches_title?(keyword)
    @title.downcase.include?(keyword.downcase)
  end

  def matches_artist?(keyword)
    @artist.downcase.include?(keyword.downcase)
  end
end

require_relative '../item'

class MusicAlbum < Item
  attr_accessor :publish_date, :archive, :on_spotify

  def initialize(publish_date, archive, on_spotify)
    super(publish_date, archive)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify == true
  end
end

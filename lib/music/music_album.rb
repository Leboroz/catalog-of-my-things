require_relative '../item'

class MusicAlbum < Item
  attr_accessor :publish_date, :archive, :on_spotify, :name

  def initialize(name, publish_date, archive, on_spotify, id = rand(1..1000))
    super(name, publish_date, archive, id)
    @on_spotify = on_spotify
    @name = name
  end

  def can_be_archived?
    super && @on_spotify == true
  end
end

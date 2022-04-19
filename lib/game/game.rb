require_relative '../item'
require_relative 'author'

class Game < Item
  def initialize(publish_date, archived, multiplayer, last_played_at)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    parent = super()
    current_year = Date.today.year
    date = Date._parse(@last_played_at)
    diference = current_year - date[:year]
    parent && diference > 2
  end
end

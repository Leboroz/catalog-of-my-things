require_relative '../item'
require_relative 'author'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :name

  def initialize(publish_date, archived, multiplayer, last_played_at, name, id = rand(1..1000))
    super(publish_date, archived, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @name = name
  end

  def can_be_archived?
    parent = super()
    current_year = Date.today.year
    date = Date._parse(@last_played_at)
    diference = current_year - date[:year]
    parent && diference > 2
  end
end

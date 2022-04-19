require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(name, publish_date, archived, publisher, cover_state, id = rand(1..1000))
    super(name, publish_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_s
    "[Book]
name: #{@name}
publish date: #{@publish_date}
archive: #{@archived}
publisher: #{@publisher}
cover state: #{@cover_state}
    "
  end

  def to_json(*_args)
    {
      id: @id,
      name: @name,
      publish_date: @publish_date,
      archive: @archived,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end
end

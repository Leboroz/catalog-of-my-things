require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(name, publish_date, archive, publisher, cover_state)
    super(name, publish_date, archive)
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
archive: #{@archive}
publisher: #{@publisher}
cover state: #{@cover_state}
    "
  end
end

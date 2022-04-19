require_relative "../item"

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, archive, publisher, cover_state)
    super(publish_date, archive)
    @publisher = publisher
    @cover_letter = cover_letter
  end

  def can_be_archived?
    super || cover_state == "bad"
  end
end

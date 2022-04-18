require "date"

class Item 
  attr_accessor :id, :publish_date, :archived, :genre, :author, :label
  attr_reader  :genre, :author

  def initialize(id = rand(1..1000), publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end
end

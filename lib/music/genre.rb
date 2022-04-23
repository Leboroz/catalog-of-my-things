class Genre
  attr_accessor :id, :name, :items

  def initialize(name, id = rand(1..100))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end

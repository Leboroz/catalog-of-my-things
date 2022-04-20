class Genre
  attr_accessor :id, :name, :items

  def initialize(name, items, id = rand(1..100))
    @id = id
    @name = name
    @items = items
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end

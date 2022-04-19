class Label
  attr_accessor :id, :title, :color, :items

  def initialize(id = rand(1..1000), title, color, items)
    @id = id
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    @items << item
    item.label= self
  end
end

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color, id = rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_s
    "[Label]
   Id: #{@id}
Title: #{@title}
Color: #{@color}
     "
  end
end

class Genre
  attr_accessor :id, :name, :items

  def initialize(name, id = rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

	def to_s
		"[genre]
		ID: #{@id}
		name: #{@name}
		"
	end

	def to_json(*_args)
		{
			'id' => @id,
			'name' => @name,
			'items' => @items.map(&:id)
		}
	end
end

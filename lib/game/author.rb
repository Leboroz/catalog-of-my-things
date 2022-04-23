class Author
  attr_reader :list, :first_name, :last_name

  def initialize(first_name, last_name, id = rand(1..1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @list = []
  end

  def add_item(item)
    @list.push(item)
    item.author = self
  end
end

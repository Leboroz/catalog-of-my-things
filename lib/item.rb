require "date"

class Item 
  attr_accessor :id, :publish_date, :archived, :genre, :author, :label
  attr_reader  :genre, :author

  def initialize(id = rand(1..1000), publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

	def can_be_archived?
		current_year = Date.today().year
		date = Date._parse(@publish_date)
		publish_year = current_year - date[:year]
		puts publish_year
		publish_year > 10
	end

	def move_to_archive
		@archived = true if can_be_archived?
	end
end

item = Item.new("1980-08-01", true)

puts item.can_be_archived?

require 'date'

class Item
  attr_accessor :id, :publish_date, :archived, :genre, :author, :label, :name

<<<<<<< HEAD
  def initialize(name, publish_date, archived, id = rand(1..1000))
    @name = name
		@id = id
=======
  def initialize( name, publish_date, archived, id = rand(1..1000))
    @name = name
    @id = id
>>>>>>> develop
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    current_year = Date.today.year
    date = Date._parse(@publish_date)
    publish_year = current_year - date[:year]
    publish_year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end

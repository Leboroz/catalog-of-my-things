require 'date'

class Item
  attr_accessor :id, :publish_date, :archived, :name
  attr_reader :genre, :author, :label

  def initialize(name, publish_date, archived, id = rand(1..1000))
    @name = name
    @id = id
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

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.list.push(self) unless author.list.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end

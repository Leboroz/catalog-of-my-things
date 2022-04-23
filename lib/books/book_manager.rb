require_relative 'book'
require_relative 'label'
require 'fileutils'
require 'json'

class BookManager
  attr_accessor :list_books, :list_labels

  def initialize
    @list_books = []
    @list_labels = []
    load
  end

  def add_label
    puts 'Create a Label', 'Input title'
    print 'Title: '
    title = gets.chomp

    puts 'Input color'
    print 'Color: '
    color = gets.chomp

    @list_labels << Label.new(title, color)
    puts '', 'Label created'
  end

  def add_book
    puts 'Enter book name'
    print 'Name: '
    name = gets.chomp.strip

    puts 'Enter date of publish'
    print 'date(YYYY-MM-DD): '
    date = gets.chomp

    puts 'Do you want to archive Yes or no'
    print 'Opt[Y/N]: '
    archive = gets.chomp.downcase == 'y'

    puts 'Enter publisher'
    print 'input: '
    publisher = gets.chomp.strip
    opt = { '1': 'good', '2': 'bad' }
    puts 'Enter 1 for good and 2 for bad'
    print 'opt: '
    cover_state = opt[gets.chomp]
    @list_books << Book.new(name, date, archive, publisher, cover_state)
    puts '', 'Book Created!', ''
    add_label
  end

  def print_books
    puts @list_books
  end

  def print_labels
    puts @list_labels
  end

  def save
    json = {
      'books' => @list_books.map(&:to_json),
      'labels' => @list_labels.map(&:to_json)
    }

    File.write('books.json', JSON.pretty_generate(json))
  end

  def load
    FileUtils.touch('books.json') unless File.exist?('books.json')
    json = File.read('books.json')
    return if json == ''

    json = JSON.parse(json)
    p json
    @list_books = to_books(json['books'])
    @list_labels = to_labels(json['labels'])
  end

  private

  def to_books(books)
    books.map do |book|
      Book.new(
        book['name'],
        book['publish_date'],
        book['archive'],
        book['publisher'],
        book['cover_state'],
        book['id']
      )
    end
  end

  def to_labels(labels)
    labels.map do |label|
      new_label = Label.new(
        label['title'],
        label['color'],
        label['id']
      )
      puts new_label
      label['items'].each { |item| new_label.add_item(@list_books.select { |book| book.id == item }.first) }
      new_label
    end
  end
end

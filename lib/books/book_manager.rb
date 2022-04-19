require_relative 'book'

class BookManager
  attr_accessor :list_books

  def initialize
    @list_books = []
    @list_labels = []
  end

  def add_label
    puts "Input title"
    print "Title: "
    title = gets.chomp

    puts "Input color"
    print "Color: "
    color = gets.chomp

    @list_labels << Label.new(title, color)
    puts "", "Label created"
  end

  def add_book
    puts "Enter book name"
    print "Name: "
    name = gets.chomp.strip

    puts "Enter date of publish"
    print "date: "
    date = gets.chomp

    puts "Do you want to archive Yes or no"
    print "Opt[Y/N]: "
    archive = gets.chomp.downcase

    case archive
      when "y" then archive = true
      when "n" then archive = false
      else
        puts "Invalid option"
        return
    end

    puts "Enter publisher"
    print "input: "
    publisher = gets.chomp.strip

    opt = { "1": "good", "2": "bad"}

    puts "Enter 1 for good and 2 for bad"
    print "opt: "
    cover_state = opt[gets.chomp]

    @list << Book.new(date, archive, publisher, cover_state)
    puts "","Book Created!"
  end

  def print_books
    puts @list_books
  end

  def print_labels
    puts @list_labels
  end
end

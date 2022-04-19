require_relative 'game'
require_relative 'author'

class GamesManager
  def initialize
    @games = []
    @authors = []
  end

  def add_game
    puts 'name:'
    name = gets.chomp.capitalize
    puts 'publish date: (YYYY-MM-DD)'
    p_date = gets.chomp
    puts 'is archived? [Y/N]'
    archived = gets.chomp.upcase == 'Y'
    puts 'has multiplayer? [Y/N]'
    multi = gets.chomp.upcase == 'Y'
    puts 'last played at: (YYYY-MM-DD)'
    last = gets.chomp
    game = Game.new(p_date, archived, multi, last, name)
    author = add_author
    author.add_item(game)
    @games.push(game)
    puts 'Game created succesfully'
  end

  def add_author
    puts "Author's first name:"
    first = gets.chomp.capitalize
    puts "Author's last name:"
    last = gets.chomp.capitalize
    author = Author.new(first, last)
    @authors.push(author)
    author
  end

  def list_games
    @games.each_with_index do |game, index|
      puts "#{index}\) name: '#{game.name}', publish date: #{game.publish_date}, last time played: #{game.last_played_at}"
    end
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "#{index}\) name: '#{author.first_name << ' ' << author.last_name}'"
    end
  end
end

manager = GamesManager.new

manager.add_game
manager.list_games
manager.list_authors

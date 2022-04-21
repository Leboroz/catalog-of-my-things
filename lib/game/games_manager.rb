require_relative 'game'
require_relative 'author'
require 'fileutils'
require 'json'

class GamesManager
  def initialize
    @games = []
    @authors = []
    read_games
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
    game = Game.new(name, p_date, archived, multi, last)
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
      puts "#{index}\)name:'#{game.name}', publish date:#{game.publish_date}, last time played:#{game.last_played_at}"
    end
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "#{index}\) name: '#{author.first_name << ' ' << author.last_name}'"
    end
  end

  def save_games
    arr = []
    @games.each do |game|
      arr.push({
                 name: game.name,
                 publish_date: game.publish_date,
                 archived: game.archived,
                 multiplayer: game.multiplayer,
                 last_played_at: game.last_played_at,
                 id: game.id,
                 author_first: game.author.first_name,
                 author_last: game.author.last_name
               })
    end
    FileUtils.touch('games.json') unless File.exist?('games.json')
    File.write('games.json', JSON.pretty_generate(arr))
  end

  def read_games
    return unless File.exist?('games.json')

    content = JSON.parse(File.read('games.json'))
    content.each do |data|
      game = Game.new(data['name'], data['publish_date'], data['archived'], data['multiplayer'],
                      data['last_played_at'], data['id'])
      author = Author.new(data['author_first'], data['author_last'])
      game.author = author
      author.add_item(game)
      @games.push(game)
      @authors.push(author)
    end
  end
end

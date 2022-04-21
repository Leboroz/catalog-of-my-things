require_relative './books/book_manager'
require_relative './game/gamesManager'
require_relative './music/music_manager'

class App
  def initialize
    @book_manager = BookManager.new
    @game_manager = GamesManager.new
    @music_manager = MusicManager.new
  end

  def main_menu(option)
    case option.to_i
    when 1 then @book_manager.print_books
    when 2 then @music_manager.print_albums
    when 3 then @game_manager.list_games
    when 4 then @music_manager.print_genres
    when 5 then @book_manager.print_labels
    when 6 then @game_manager.list_authors
    when 7 then @book_manager.add_book
    when 8 then @music_manager.album_menu
    when 9 then @game_manager.add_game
	when 10 then save
    end
  end

  def save
	@book_manager.save
	@game_manager.save_games
	@music_manager.write_json
  end
end

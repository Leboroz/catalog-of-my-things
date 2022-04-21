require_relative './lib/app'

class Main
  def start
    puts 'Welcome to Catalog of my things!'
			app = App.new
    loop do
      puts "Please choose an option by entering a number
1-List all books
2-List all music albums
3-List of games
4-List all genres (e.g 'Comedy', 'Thriller')
5-List all labels (e.g. 'Gift', 'New')
6-List all authors (e.g. 'Stephen King')
7-Add a book
8-Add a music album
9-Add a game
10-Exit"
      num = gets.chomp.to_i
      break if num == 10
			app.main_menu(num)
      puts '', 'Press enter to continue'
      gets.chomp
      clear
    end
    puts "Thanks for using this app!"
    gets.chomp
    clear
  end

  def clear
    system "cls"
    system "clear"
  end
end

game = Main.new

game.start

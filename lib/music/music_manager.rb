require_relative 'genre'
require_relative 'music_album'

class MusicManager
  attr_accessor :list_gender, :list_album

  def initialize
    @list_gender = []
    @list_album = []
  end

  def validated_boolean(option)
    case option
    when 'Y'
      true
    when 'N'
      false
    else
      puts 'Invalid option'
    end
  end

  def genre_menu
    puts "Add a new Music Album\n\n"

    puts 'Album genre name:'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @list_gender << genre
    genre
  end

  def album_menu
    puts 'Album name: '
    album_name = gets.chomp.capitalize
    puts 'Date of publication example formta: [YYYY-MM-DD]'
    date = gets.chomp
    puts 'Can be archived? [Y/N]'
    archived = gets.chomp.upcase
    check_ar = validated_boolean(archived)
    puts 'Its in spotify? [Y/N]'
    spotify = gets.chomp.upcase
    check_spoti = validated_boolean(spotify)
    album = MusicAlbum.new(album_name, date, check_ar, check_spoti)
    puts 'Album created succesfully'
    @list_album << album
  end

  def list_genre
    @list_gender.each do |genre|
      puts "ID: #{genre.id}-) genre: #{genre.name}"
    end
  end

  def list_albums
    @list_album.each do |album|
      puts "ID: #{album.id}-) album name: #{album.name} publication date: #{album.publish_date} "
    end
  end
end

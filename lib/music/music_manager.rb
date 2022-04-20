require 'json'
require 'fileutils'

require_relative 'genre'
require_relative 'music_album'

class MusicManager
  attr_accessor :list_genre, :list_album

  def initialize
    @list_genre = []
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
    @list_genre << genre
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
		genre = genre_menu
		genre.add_item(album)
    puts 'Album created succesfully'
    @list_album << album
  end

  def list_genre
    @list_genre.each do |genre|
      puts "ID: #{genre.id}-) genre: #{genre.name}"
    end
  end

  def list_albums
    @list_album.each do |album|
      puts "ID: #{album.id}-) album name: #{album.name} publication date: #{album.publish_date} "
    end
  end

	def to_album(albums)
		albums.map do |item|
			MusicAlbum.new(
				item['name'],
				item['published'],
				item['archived'],
				item['spotify'],
				item['id']
			)
		end
	end

	def to_genre(genre)
		genre.map do |item|
			new_genre = Genre.new(
				item['name'],
				item['id']
			)
			item['items']. each {|e| new_genre.add_item(e)}
			new_genre
		end
	end

	def write_json
		json = {
			'albums' => @list_album.map(&:to_json),
			'genre' => @list_genre.map(&:to_json)
		}
		File.write('music.json', JSON.pretty_generate(json))
	end

	def load_json
		Fileutiles.touch('music.json') unless File.exist?('music.json')
			json = File.read('music.json')
			json = JSON.parse(json)
			@list_album = to_album(json['albums'])
			@list_genre = to_genre(json['genre'])
	end
end

music = MusicManager.new

music.album_menu
music.write_json

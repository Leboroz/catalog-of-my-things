require 'json'
require 'fileutils'

require_relative 'genre'
require_relative 'music_album'

class MusicManager
  attr_accessor :list_genre, :list_album

  def initialize
    @list_genre = []
    @list_album = []
		load_json
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
    puts 'Add album genre:'
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

  def print_genres
    @list_genre.each do |genre|
      puts "ID: #{genre.id}-) genre: #{genre.name}"
    end
  end

  def print_albums
    @list_album.each do |album|
      puts "ID: #{album.id}-) album name: #{album.name} publication date: #{album.publish_date} "
    end
  end

	def write_json
		arr = []
		@list_album.each do |album|
			arr.push({name: album.name, genre: album.genre.name, published: album.publish_date,
				archived: album.archived, spotify: album.on_spotify, id: album.id})
		end
		FileUtils.touch('music.json') unless File.exist?('music.json')
		File.write('music.json', JSON.pretty_generate(arr))
	end

	def load_json
		return unless File.exist?('music.json')
		file = JSON.parse(File.read('music.json'))
		file.each do |data|
			album = MusicAlbum.new(data['name'], data['published'], data['archived'],
				data['spotify'], data['id'])
				genre = Genre.new(data['genre'])
				album.genre = genre
				genre.add_item(album)
				@list_album.push(album)
				@list_genre.push(genre)
		end
	end
end

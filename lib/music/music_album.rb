require_relative '../item'

class MusicAlbum < Item
  attr_accessor :name, :publish_date, :archived, :on_spotify

  def initialize(name, publish_date, archived, on_spotify, id = rand(1..1000))
    super(publish_date, archived, id)
    @on_spotify = on_spotify
		@name = name
  end

  def can_be_archived?
    super && @on_spotify == true
  end

	def to_s
		"[album]
		ID: #{@id}
		name: #{@name}
		archive: #{@archived}
		published: #{@publish_date}
		spotify: #{@on_spotify}
		"
	end

	def to_json(*_args)
		{
			id:  @id,
			name: @name,
			published: @publish_date,
			archived: @archived,
			spotify: @on_spotify
		}
	end

end

require_relative '../item'

class MusicAlbum < Item
	attr_accessor :name, :publish_date, :archive, :on_spotify
	
	def initialize(name, publish_date, archive, on_spotify)
		super(name, publish_date, archive)
		@on_spotify = on_spotify
	end

	def can_be_archived?
		super && @on_spotify == true
	end
end
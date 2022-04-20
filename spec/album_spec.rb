require_relative '../lib/music/music_album'

describe MusicAlbum do
	before (:each) do
		@album = MusicAlbum.new('lupita', '1998-09-09', true, true)
		@genre = double('genre', name: 'Rock')
		@album.genre = @genre
	end

	context 'Be an instance of MusicAlbum class' do
		it '#new' do
			expect(@album).to be_instance_of(MusicAlbum)
		end
	end

	context 'Check genre values' do
		it '#new' do
			expect(@album.genre.name).to eq('Rock')
		end
	end

	context 'Check if the album can be archived' do
		it 'expect can_be_archive? method return true' do
			expect(@album.can_be_archived?).to be(true)
		end
	end
end
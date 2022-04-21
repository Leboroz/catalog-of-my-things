require_relative '../lib/music/genre'

describe Genre do
  before(:each) do
    @genre = Genre.new('Rock')
    @album = object_double('album', genre: 'Rock')
    allow(@album).to receive(:genre=) { nil }
  end

  context 'Be an instance of Genre class' do
    it '#new' do
      expect(@genre).to be_instance_of(Genre)
    end
  end

  context 'Check if method add_item'
  it '#add_item' do
    @genre.add_item(@album)
    expect(@genre.items.length).to be(1)
  end
  context
end

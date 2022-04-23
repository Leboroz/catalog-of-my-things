require_relative '../lib/game/author'

describe Author do
  before :each do
    @author = Author.new('lisandro', 'seia')
    @game = object_double('game', author: 'lisandro')
    allow(@game).to receive(:author=) { nil }
  end

  context '#new' do
    it 'Creates an instance of author' do
      expect(@author).to be_instance_of(Author)
    end
  end

  context '#add_item' do
    it 'add_item method should update the game author' do
      @author.add_item(@game)
      @author.add_item(@game)
      @author.add_item(@game)

      expect(@author.list.length).to be(3)
    end
  end
end

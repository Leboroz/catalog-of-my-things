require_relative '../lib/game/game'

describe Game do
  before :each do
    @game = Game.new('among us', '2010-10-10', false, true, '2019-10-10')
    @author = double('author', first_name: 'lisandro', last_name: 'seia')
  end

  context '#new' do
    it 'Creates a new game' do
      expect(@game).to be_instance_of(Game)
    end
  end

  context '#can_be_archived' do
    it 'expects can_be_archived to be true' do
      expect(@game.can_be_archived?).to be(true)
    end
  end
end

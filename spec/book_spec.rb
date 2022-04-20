require './spec_helper'

describe Book do
  before :each do
    @book = Book.new('HP', '2015-03-22', true, 'lp', 'good', 1)
  end

  context '#new' do
    it 'should instatiate a book' do
      expect(@book).to be_instance_of(Book)
    end
  end

  context '#to_s' do
    it 'should return a string with the properties of the book' do
      expected = "[Book]
name: HP
publish date: 2015-03-22
archive: true
publisher: lp
cover state: good
    "
      case_test = @book.to_s

      expect(case_test).to eql(expected)
    end
  end

  context '#to_json' do
    it 'should return an object with all the properties of the book' do
      expected =
        {
          id: 1,
          name: 'HP',
          publish_date: '2015-03-22',
          archive: true,
          publisher: 'lp',
          cover_state: 'good'
        }

      case_test = @book.to_json

      expect(case_test).to eql(expected)
    end
  end

  context '#can_be_archived?' do
    it 'should return true if cover_state = bad' do
      @book.cover_state = 'bad'
      expected = true

      case_test = @book.can_be_archived?

      expect(case_test).to be(expected)
    end

    it 'should return true if archive = true' do
      @book.publish_date = '2005-03-22'
      expected = true

      case_test = @book.can_be_archived?

      expect(case_test).to be(expected)
    end

    it 'should return false if publish_date < 10 years OR cover_state = good' do
      expected = false

      case_test = @book.can_be_archived?

      expect(case_test).to be(expected)
    end
  end
end

require_relative '../lib/books/label'

describe Label do
  before :each do
    @label = Label.new('New', 'Red', 1)
  end

  context '#new' do
    it 'should be an instance of label' do
      expect(@label).to be_instance_of(Label)
    end
  end

  context '#add_item' do
    it 'should take a child of item and add it to @items' do
      book = double('Book')
      allow(book).to receive(:label=) { nil }

      @label.add_item(book)

      expect(@label.items).to match_array([book])
    end
  end

  context '#to_s' do
    it 'should return a string with its attributes' do
      expected = "[Label]
   Id: 1
Title: New
Color: Red
     "

      case_test = @label.to_s

      expect(case_test).to eql(expected)
    end
  end

  context '#to_json' do
    it 'should return an object with its attributes' do
      expected =
        {
          'id' => 1,
          'title' => 'New',
          'color' => 'Red',
          'items' => []
        }

      case_test = @label.to_json

      expect(case_test).to eql(expected)
    end
  end
end

require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('The Lord of the rings', 'Tolkien')
  end

  describe 'check title' do
    it 'returns the accurate title -> The Lord of the rings' do
      expect(@book.title).to eql 'The Lord of the rings'
    end
  end

  describe 'check author' do
    it 'returns the accurate author -> Tolkien' do
      expect(@book.author).to eql 'Tolkien'
    end
  end
end
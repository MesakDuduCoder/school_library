require_relative '../book'
require_relative '../rental'
require_relative '../person'

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

  describe 'check add_rental method' do
    it 'returns the accurate rental' do
      rental = {
            date: '10/02/2023',
            book: @book,
            person: 'Person 1',
        }
      expect(@book.add_rental(rental)).to eq([rental])
    end
  end
end
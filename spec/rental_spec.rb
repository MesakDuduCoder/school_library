require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  before :each do
    @book = Book.new('The Lord of the rings', 'Tolkien')
    @person = Person.new(18, name: 'Mike')
    @rental = Rental.new('10/02/2023', @book, @person)
  end

  describe 'check date' do
    it 'returns the correct date' do
      expect(@rental.date).to eq('10/02/2023')
    end
  end

  describe 'check book' do
    it 'returns the correct book' do
      expect(@rental.book).to eq(@book)
    end
  end

  describe 'check person' do
    it 'returns the correct person' do
      expect(@rental.person).to eq(@person)
    end
  end

  describe 'check rental in book' do
    it 'returns the correct rental in book' do
      expect(@book.rentals).to eq([@rental])
    end
  end

  describe 'check rental in person' do
    it 'returns the correct rental in person' do
      expect(@person.rentals).to eq([@rental])
    end
  end
end

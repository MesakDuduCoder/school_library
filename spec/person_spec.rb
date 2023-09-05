require_relative '../person'
require_relative '../nameable'

describe Person do
  before :each do
    @person = Person.new(20, name:'John', parent_permission:true)
  end

 describe 'Test creating new person' do
    it 'test retrieving person name' do
      expect(@person.name).to eq('John')
    end

    it 'test can use service method' do
        expect(@person.can_use_services?).to eq(true)
    end    

    it 'test correct name method' do
        expect(@person.correct_name).to eq('John')
    end

    it 'test add rental method' do
        rental = {
            date: '10/02/2023',
            book: 'The Lord of the Rings',
            person: @person,
        }
        @person.add_rental(rental)
        expect(@person.rentals).to eq([rental])
    end

    it 'test of age method' do
        expect(@person.send(:of_age?)).to eq(true)
    end
  end
end
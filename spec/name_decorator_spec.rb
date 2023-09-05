require_relative '../name_decorator'

describe NameDecorator do
  let(:mock_nameable) { double('Nameable') }

  subject { described_class.new(mock_nameable) }

  describe 'Testing correct_name method' do
    it 'delegates the correct_name method to the wrapped Nameable object' do
      expect(mock_nameable).to receive(:correct_name).and_return('Mock Correct Name')
      expect(subject.correct_name).to eql 'Mock Correct Name'
    end
  end
end

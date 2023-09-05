require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:mock_nameable) { double('Nameable') }
  subject { described_class.new(mock_nameable) }

  describe '#trim_name' do
    it 'trims the name returned by the wrapped Nameable object' do
      expect(mock_nameable).to receive(:correct_name).and_return('admiral general president prime minister aladeen')

      expect(subject.correct_name).to eql 'admiral ge'
    end
  end
end

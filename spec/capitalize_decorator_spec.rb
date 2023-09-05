require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:mock_nameable) { double("Nameable") }
  subject { described_class.new(mock_nameable) }

  describe '#correct_name' do
    it 'capitalizes the name returned by the wrapped Nameable object' do
      expect(mock_nameable).to receive(:correct_name).and_return("bruce")

      expect(subject.correct_name).to eql "Bruce"
    end
  end
end

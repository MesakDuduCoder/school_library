require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Chemistry')
  end

  context 'Testing Classroom' do
    it 'test label retrieving from Classroom class' do
      expect(@classroom.label).to eq('Chemistry')
    end
  end

  context 'Test add_student method' do
    it 'Should return an array of added students' do
      student = Student.new(17, 'Rose', false)
      @classroom.add_student(student)
      expect(@classroom.student).to eq([student])
    end
  end
end
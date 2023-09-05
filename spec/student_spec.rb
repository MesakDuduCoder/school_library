require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new(10, name: 'Sonny', parent_permission: true)
  end

  context 'testing the student variables and methods' do
    it 'test name of student' do
      expect(@student.name).to eq('Sonny')
    end

    it 'test age of student' do
      expect(@student.age).to eq(10)
    end

    it 'test parent permission of student' do
      expect(@student.parent_permission).to eq(true)
    end

    it 'test can use services' do
      expect(@student.can_use_services?).to eq(true)
    end

    it 'test classroom of student' do
      classroom = Classroom.new('class-10')
      @student.classroom = classroom
      expect(classroom.students).to eq([@student])
    end

    it 'test play hooky of student' do
      expect(@student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end

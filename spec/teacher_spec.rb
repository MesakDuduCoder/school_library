require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(30, 'Chemistry', name: 'Mike')
  end

  context 'testing the teacher variables and methods' do
    it 'test name of teacher' do
      expect(@teacher.name).to eq('Mike')
    end

    it 'test specialization of teacher' do
      expect(@teacher.specialization).to eq('Chemistry')
    end

    it 'test age of teacher' do
      expect(@teacher.age).to eq(30)
    end

    it 'test can use services' do
      expect(@teacher.can_use_services?).to eq(true)
    end
  end
end

require_relative 'person'

class Student < Person
  attr_accessor :name, :classroom

  def initialize(age, classroom, name: 'Unknown')
    super(age, name: name)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

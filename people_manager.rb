require_relative 'student'
require_relative 'teacher'

module PeopleManager
  def self.create_student(people, age, name, has_parent_permission)
    student = Student.new(age, name: name, parent_permission: has_parent_permission)
    people << student
    student
  end

  def self.create_teacher(people, age, specialization, name)
    teacher = Teacher.new(age, specialization, name: name)
    people << teacher
    teacher
  end

  def self.list_people(people)
    if people.empty?
      puts 'There are no people'
    else
      people.each_with_index do |person, i|
        puts "Number: #{i + 1}, Name: #{person.name}, age: #{person.age}, ID: #{person.id}"
      end
    end
  end

  def self.list_rentals(people, person_id)
    person = people.find { |p| p.id == person_id }
    if person
      puts "Name: #{person.name}"
      if person.rentals.empty?
        puts 'Has no rentals'
      else
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    else
      puts 'Person not found'
    end
  end
end

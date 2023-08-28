require_relative 'person'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

person = Person.new(22, name: 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

classroom = Classroom.new('class-10')

Student.new(18, classroom, name: 'Mike')
Student.new(20, classroom, name: 'Julian')

# students will be actomatically added to classroom
classroom.students.each do |student|
  puts "#{student.name}, Age: #{student.age}, classroom: #{student.classroom.label}"
end

book1 = Book.new('Book 1', 'Author 1')
book2 = Book.new('Book 2', 'Author 2')
book3 = Book.new('Book 3', 'Author 3')

person1 = Person.new(12, name: 'Alice')
person2 = Person.new(11, name: 'Jess')

Rental.new('2023-08-04', book1, person1)
Rental.new('2023-08-05', book2, person1)
Rental.new('2023-08-05', book3, person1)
Rental.new('2023-08-05', book3, person2)

# When new rental is created, it will be automatically added to book and person
puts "#{person1.name}'s rentals:"
person1.rentals.each do |rental|
  puts "#{rental.book.title} - #{rental.date}"
end
puts "#{person2.name}'s rentals:"
person2.rentals.each do |rental|
  puts "#{rental.book.title} - #{rental.date}"
end
puts "\n#{book1.title}'s rentals:"
book1.rentals.each do |rental|
  puts "#{rental.person.name} - #{rental.date}"
end
puts "\n#{book2.title}'s rentals:"
book2.rentals.each do |rental|
  puts "#{rental.person.name} - #{rental.date}"
end
puts "\n#{book3.title}'s rentals:"
book3.rentals.each do |rental|
  puts "#{rental.person.name} - #{rental.date}"
end

require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'

class App
  attr_accessor :rentals, :books, :people

  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'There are no books'
    else
      @books.each_with_index do |book, i|
        puts "Number: #{i + 1}, Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'There are no people'
    else
      @people.each_with_index do |person, i|
        puts "Number: #{i + 1}, Name: #{person.name},age: #{person.age}, ID: #{person.id}"
      end
    end
  end

  def create_person(name, age)
    puts 'Create student or teacher?'
    puts 'To create student input 1 for teacher input 2'
    type = gets.chomp.to_i
    if type == 1
      puts 'Enter classroom'
      class_level = gets.chomp
      classroom = Classroom.new(class_level)
      person = Student.new(age, classroom, name: name)
      @people << person
    elsif type == 2
      puts 'Enter specialization'
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name: name)
      @people << person
    else
      puts 'Invalid input'
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def list_rentals(person_id)
    @people.each do |person|
      next unless person.id == person_id

      puts "Name: #{person.name}"
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end
end

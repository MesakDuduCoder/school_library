require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'
require 'pry'

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
        puts "Number: #{i + 1}, Name: #{person.name}, age: #{person.age}, ID: #{person.id}"
      end
    end
  end

  def create_student(age, name, has_parent_permission)
    student = Student.new(age, name: name, parent_permission: has_parent_permission)
    binding.pry
    @people << student
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher
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
      if person.rentals.empty?
        puts 'Has no rentals'
      else
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
  end
end

require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book_manager'
require_relative 'rental_manager'
require_relative 'people_manager'
require_relative 'data_manager'

class App
  attr_accessor :rentals, :books, :people

  def initialize()
    @books = []
    @people = []
    @rentals = []
    @app_data = DataManager.new
    load_data
  end

  include RentalManager
  include PeopleManager
  include BookManager

  # def list_books
  #   BookManager.list_books(@books)
  # end

  # def list_people
  #   PeopleManager.list_people(@people)
  # end

  # def create_student(age, name, has_parent_permission)
  #   student = PeopleManager.create_student(@people, age, name, has_parent_permission)
  #   puts "Student #{student.name} created with ID #{student.id}."
  # end

  # def create_teacher(age, specialization, name)
  #   teacher = PeopleManager.create_teacher(@people, age, specialization, name)
  #   puts "Teacher #{teacher.name} created with ID #{teacher.id}."
  # end

  # def create_book(title, author)
  #   BookManager.create_book(@books, title, author)
  #   puts "Book #{title} by #{author} created."
  # end

  # def create_rental(date, book, person)
  #   create_rental(@rentals, date, book, person)
  # end

  # def list_rentals(person_id)
  #   PeopleManager.list_rentals(@people, person_id)
  # end

  def load_data
    @books = @app_data.load_books
    @people = @app_data.load_people
    @rentals = @app_data.load_rentals(@books, @people)
  end
end

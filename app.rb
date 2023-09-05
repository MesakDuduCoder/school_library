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

  def load_data
    @books = @app_data.load_books
    @people = @app_data.load_people
    @rentals = @app_data.load_rentals(@books, @people)
  end
end

require_relative 'app'

def create_person(app)
  puts "\n"
  puts 'Enter person name:'
  name = gets.chomp
  puts 'Enter person age:'
  age = gets.chomp.to_i
  app.create_person(name, age)
end

def create_book(app)
  puts "\n"
  puts 'Enter book title:'
  title = gets.chomp
  puts 'Enter book author:'
  author = gets.chomp
  app.create_book(title, author)
end

def create_rental(app)
  puts "\n"
  puts 'Enter rental date:'
  date = gets.chomp
  app.list_books
  puts 'Enter book number:'
  book = gets.chomp.to_i
  app.list_people
  puts 'Enter person number:'
  person = gets.chomp.to_i
  app.create_rental(date, app.books[book - 1], app.people[person - 1])
end

def list_rentals(app)
  puts "\n"
  app.list_people
  puts 'Enter person id:'
  id = gets.chomp.to_i
  app.list_rentals(id)
end

def list_options
  puts "\n"
  puts 'Enter number to pick an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person id'
  puts '7. End'
end

def main
  app = App.new
  loop do
    list_options
    option = gets.chomp.to_i
    options = {
      1 => -> { app.list_books },
      2 => -> { app.list_people },
      3 => -> { create_person(app) },
      4 => -> { create_book(app) },
      5 => -> { create_rental(app) },
      6 => -> { list_rentals(app) },
      7 => -> { exit }
    }
    case option
    when 1, 2, 3, 4, 5, 6, 7
      options[option].call
    end
  end
end

main

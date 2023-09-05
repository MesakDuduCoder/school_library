require 'json'
class DataManager
  DATA_FOLDER = 'data/'
  def save_books(books)
    File.open("#{DATA_FOLDER}books.json", 'w') do |file|
      data = { 'Books' => books.map { |book| { 'title' => book.title, 'author' => book.author } } }
      file.write(JSON.pretty_generate(data))
    end
  end
  def load_books
    return [] unless File.exist?("#{DATA_FOLDER}books.json")
    data = JSON.parse(File.read("#{DATA_FOLDER}books.json"))
    books = []
    data['Books'].map { |book_data| books << Book.new(book_data['title'], book_data['author']) }
    books
  end

  def save_people(people)
    File.open("#{DATA_FOLDER}people.json", 'w') do |file|
      data = { 'People' => people.map { |person| person.to_h } }
      file.write(JSON.pretty_generate(data))
    end
  end
  def load_people
    return [] unless File.exist?("#{DATA_FOLDER}people.json")
    data = JSON.parse(File.read("#{DATA_FOLDER}people.json"))
    persons = []
    data['People'].map do |person_data|
      if person_data['type'] == 'Teacher'
        persons << Teacher.new(person_data['age'].to_i, person_data['specialization'], name: person_data['name'])
      else
        persons << Student.new(person_data['age'].to_i, name: person_data['name'], parent_permission: person_data['parent_permission'])
      end
    end
    persons
  end
  def save_rentals(books, people, rentals)
    rentals_data = []
    rentals.each do |rental|
      book_index = books.index(rental.book)
      person_index = people.index(rental.person)
      rentals_data << { 'date' => rental.date, 'book' => book_index, 'person' => person_index }
    end
    File.open("#{DATA_FOLDER}rentals.json", 'w') do |file|
      file.write(JSON.pretty_generate(rentals_data))
    end
  end
  def load_rentals(books, people)
    return [] unless File.exist?("#{DATA_FOLDER}rentals.json")
    data = JSON.parse(File.read("#{DATA_FOLDER}rentals.json"))
    rentals_list = []
    data.each do |rental_data|
      book = books[rental_data['book']]
      person = people[rental_data['person']]
      rentals_list << Rental.new(rental_data['date'], book, person)
    end
    rentals_list
  end
end
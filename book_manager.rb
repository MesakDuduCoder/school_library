require_relative 'book'

module BookManager
  def self.create_book(books, title, author)
    book = Book.new(title, author)
    books << book
    book
  end

  def self.list_books(books)
    if books.empty?
      puts 'There are no books'
    else
      books.each_with_index do |book, i|
        puts "Number: #{i + 1}, Title: #{book.title}, Author: #{book.author}"
      end
    end
  end
end

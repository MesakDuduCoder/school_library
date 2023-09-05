require_relative 'book'

module BookManager
  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    save_book_to_file(@books)
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

  def save_book_to_file(books)
    @app_data.save_books(books)
  end
end

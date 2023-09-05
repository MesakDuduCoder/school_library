module RentalManager
  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
    save_rental_to_file(@rentals)
  end

  def save_rental_to_file(rentals)
    @app_data.save_rentals(@books, @people, rentals)
  end 
end

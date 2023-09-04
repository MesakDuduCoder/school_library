module RentalManager
  def self.create_rental(rentals, date, book, person)
    rental = Rental.new(date, book, person)
    rentals << rental
    rental
  end
end

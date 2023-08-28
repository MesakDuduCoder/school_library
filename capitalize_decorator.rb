require_relative 'nameable'

class CapitalizeDecorator < NameDecorator
  def correct_name
    super.capitalize
  end
end

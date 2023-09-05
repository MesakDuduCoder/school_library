require_relative 'name_decorator'

class CapitalizeDecorator < NameDecorator
  def correct_name
    super.capitalize
  end
end

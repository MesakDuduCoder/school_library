require_relative 'nameable'

class TrimmerDecorator < NameDecorator
  def correct_name
    super[0..9]
  end
end

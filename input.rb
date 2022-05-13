class Input

  @input
  DIGITS = [*1..6]

  attr_reader :input

  def initialize(input)
    @input = input
  end


  def validate
    #Checks for numeric string of 4 digits between 1 and 6.

    return false unless @input.to_i.to_s == @input
    return false unless @input.length == 4

    @input.split('').all? do |char|
      DIGITS.include?(char.to_i)
    end
  end


end
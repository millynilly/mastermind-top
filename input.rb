class Input

  @input = ''

  attr_reader :input

  def initialize(input)
    @input = input
  end


  def validate
    #Checks for 'p' 'q' or numeric string

    return true if @input == 'p' or @input == 'q'
    return true if @input.to_i.to_s == @input
  
    puts "Invalid input. Enter 'p', 'q', or a four digit number (digits between 1 and 6)."
    false
  end


end
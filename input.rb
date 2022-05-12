class Input

  @input = ''

  attr_reader :input

  def initialize(input)
    @input = input
    puts "@@input = #{@input}, class: #{@input.class}"
  end

  def validate_guess(guess)
    #Checks digits between 1 and 6 eg '6243'

    return true if guess.split('').all? { |digit| digit.to_i.between?(1, 6) }
    false
  end

  def validate
    #Checks for 'p' 'q' or '1234' (numeric string)

    return true if @input == 'p' or @input == 'q'
    
    if @input.length == 4 && @input.to_i.integer? == true
      return true if guess.split('').all? { |digit| digit.to_i.between?(1, 6) }
    end
  
    puts "Invalid input. Enter 'p', 'q', or a four digit number (digits between 1 and 6)."
    false
  end


end
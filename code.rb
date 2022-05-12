class Code

  @code = ''
  DIGITS = [*1..6]

  attr_reader :code


  def initialize(code='')
    @code = code
  end


  def generate_code
    4.times { @code << DIGITS.sample().to_s }
    puts @code
    @code
  end


  def validate(str)

    return false unless str.length == 4

    str.split('').all? do |char|
      DIGITS.include?(char.to_i)
    end
  end


  def score_guess(guess)
    #eg returns ['XX', 'O']

    score = ['', '']
    digits = guess.code.split('')

    digits.each_with_index do |digit, ind|

      if digit == @code[ind]
        score[0] += 'X'
      elsif @code.include?(digit)
        score[1] += 'O'
      end
    end
    
    score
  end

end
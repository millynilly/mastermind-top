class Code

  @code
  DIGITS = [*1..6]

  attr_reader :code


  def initialize(code=generate_code)
    @code = code
  end
  
  
  def score_guess(guess)
    #eg returns ['XX', 'O']
    
    score = ['', '']
    code = @code.split('')
    
    digits = guess.code.split('')
    
    #Xs
    digits.each_with_index do |digit, ind|
      if digit == code[ind]
        score[0] += 'X'
        code[ind] = nil
        digits[ind] = nil
      end
    end

    #Os
    digits.each_with_index do |digit, ind|
      if digit && code.include?(digit)
        score[1] += 'O'
        code[code.index(digit)] = nil
        digits[ind] = nil
      end
    end
    
    score
  end


  private

  def generate_code
    code = ''
    4.times { code << DIGITS.sample().to_s }
    code
  end
  
end
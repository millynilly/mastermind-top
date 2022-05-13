class Code

  @code
  DIGITS = [*1..6]

  attr_reader :code


  def initialize(code=generate_code)
    @code = code
  end
  
  
  def score_guess(guess)
    #eg returns ['XX', 'O']

    score = []
    code = @code.split('')
    digits = guess.code.split('')
    
    score[0] = match_exact(digits, code) #Xs
    score[1] = match_any(digits, code)   #Os
    
    score
  end


  private

  def generate_code
    code = ''
    4.times { code << DIGITS.sample().to_s }
    code
  end


  def match_exact(digits, code)
    #Xs
    score = ''

    digits.each_with_index do |digit, ind|
      if digit == code[ind]
        score += 'X'
        code[ind] = nil
        digits[ind] = nil
      end
    end

    score
  end


  def match_any(digits, code)
    #Os
    score = ''

    digits.each_with_index do |digit, ind|
      if digit && code.include?(digit)
        score += 'O'
        code[code.index(digit)] = nil
        digits[ind] = nil
      end
    end

    score
  end

end
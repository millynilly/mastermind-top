require_relative 'input.rb'
require_relative 'code.rb'


class Game

  @code
  @score
  @guess
  @guesses
  @GUESS_MAX


  def initialize
    @code = Code.new
    @score = ['', '']
    @guesses = 0
    @GUESS_MAX = 12
    print_intro
  end
  
  
  def play

    until win? || @guesses == @GUESS_MAX
      get_guess
      get_score
      display_score
      @guesses += 1
    end
  
    display_result
    puts 'Play again?'
    ['y', 'Y'].include?(gets.chomp)
  end



  private
  
  def get_guess
    @input = Input.new(gets.chomp)
    until @input.validate
      puts 'Invalid input.'
      @input = Input.new(gets.chomp)
    end
    @guess = Code.new(@input.input)
  end
  
  
  def get_score
    @score = @code.score_guess(@guess)
  end
  
  
  def win?
    @score[0] == 'XXXX' ? true : false
  end
  
  
  def display_score
    puts @score[0] == '' ? '-' : @score[0]
    puts @score[1] == '' ? '-' : @score[1]
    puts"\n"
  end


  def display_result
    if win?
      plural = @guesses > 1 ? 'es' : ''
      puts "You won with #{@guesses} guess#{plural}!"
      puts accolade
    else
      puts "Out of guesses. You lose."
    end
    puts "\n"
  end
  
  
  def print_intro
    puts "\nPlay Mastermind
---------------
Guess the four digit code generated by the computer.\n
Digits can be from 1 to 6.
1   2   3   4   5   6\n
After your guess, feedback is given:
X means you guessed the right digit in the right position.
O means you guessed the right digit but in the wrong position.\n
You have #{@GUESS_MAX} guesses.\n
Enter a 4 digit number, with each digit between 1 and 6 eg. 2146."
  end


  def accolade
    case @guesses
    when 1
      'Woohoo. Hole in one!'
    when 2..3
      'You are on fire!'
    when 4..5
      'Outstanding!'
    when 6..7
      'Pretty good going.'
    when 8..9
      'A respectable score.'
    when 10..11
      'You got there.'
    when 12
      'In the nick of time!'
    end
  end

end
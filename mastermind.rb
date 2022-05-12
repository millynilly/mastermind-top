#!/usr/bin/env ruby

require_relative 'game.rb'
require_relative 'input.rb'
require_relative 'code.rb'


game = Game.new
game.print_intro

code = game.code
code.generate_code


until game.win? || game.guesses == game.GUESS_MAX

  #Get guess
  input = Input.new(gets.chomp)

  until input.validate
    puts 'wah'
    input = Input.new(gets.chomp)
  end

  guess = Code.new(input.input)

  puts code.score_guess(guess)
  game.increment(guesses)

end

puts game.win? ? "Game over. You win." : "Out of guesses. You lose."








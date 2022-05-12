#!/usr/bin/env ruby

require_relative 'game.rb'
require_relative 'input.rb'

GUESS_MAX = 12

game = Game.new
game.print_intro

until game.win? || game.guesses == GUESS_MAX

  inpt = Input.new(gets.chomp)
  # until inpt.validate
  #   inpt = Input.new(gets.chomp)
  # end
  
  game.feedback(inpt.input)
  

end

puts game.win? ? "Game over. You win." : "Out of guesses. You lose."








#!/usr/bin/env ruby

require_relative 'game.rb'
require_relative 'input.rb'
require_relative 'code.rb'

def play
  game = Game.new
  #game.print_intro

  code = game.code
  puts code.code


  until game.win? || game.guesses == game.GUESS_MAX

    #Get guess
    inpt = Input.new(gets.chomp)

    until inpt.validate
      puts 'Invalid input.'
      inpt = Input.new(gets.chomp)
    end

    #Score guess
    guess = Code.new(inpt.input)
    game.score = code.score_guess(guess)
    game.display_score

    game.increment_guesses
  end

  puts game.win? ? "Game over. You win." : "Out of guesses. You lose."
  puts 'Play again? y'
  play if gets.chomp == 'y' || 'Y'
end

play








#!/usr/bin/env ruby

require_relative 'game.rb'


def play
  game = Game.new
  
  until game.win? || game.guesses == game.GUESS_MAX

    game.get_guess
    game.get_score
    game.display_score
    game.increment_guesses

  end

  game.display_result
  puts 'Play again?'
  play if ['y', 'Y'].include?(gets.chomp)

end

play








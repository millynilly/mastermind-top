#!/usr/bin/env ruby

require_relative 'game.rb'

while Game.new.play do
  Game.new.play
end

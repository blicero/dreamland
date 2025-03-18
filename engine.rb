#!/usr/bin/env ruby
# coding: utf-8
# /data/code/dreamland/engine.rb
# created on 18. 03. 2025
# (c) 2025 Benjamin Walkenhorst
# Time-stamp: <2025-03-18 17:31:16 krylon>

require 'rubygems'

class Engine
  attr_reader :world, :player

  def initialize(world, player)
    @world = world
    @player = player
    @cur_loc = @world.start_loc
  end # initialize(world, player)

  def here
    @world.locations[@cur_loc]
  end

  

end # class Engine

=begin rdoc
Engine
Purpose:
Dependencies:
=end


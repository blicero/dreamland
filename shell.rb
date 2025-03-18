#!/usr/bin/env ruby
# /home/krylon/code/dreamland/shell.rb
# created on 18. 03. 2025
# (c) 2025 Benjamin Walkenhorst
# Time-stamp: <2025-03-18 18:46:29 krylon>

require 'rubygems'

require 'tty-prompt'

# Shell implements the text-mode user interface of dreamland.
class Shell
  COMMANDS = %w[attack look go talk take me save load quit].to_set.freeze

  def initialize(world, player, engine)
    @world = world
    @player = player
    @engine = engine
    @prompt = TTY::Prompt.new 
  end

  def status_msg
    "HP: #{@player.hp}/#{@player.hp_max}
XP: #{@player.xp}
Location: #{@engine.here}"
  end

  def validate_cmd(cmd)
    pieces = cmd.split(/\s+/)
    return false if pieces.empty?

    verb = pieces[0].downcase
    return false unless COMMANDS.include? verb
  end

  def run
    loop do
      puts status_msg
      cmd = @prompt.ask('>>> ') do |q|
        q.required true
        q.validate ->(input) { validate_cmd input }
        q.modify :strip
      end
    end
  end # run

  def handle_cmd(input)
    pieces = input.split(/\s+/)
    verb = pieces[0].downcase.to_sym

    case verb
    when :look
      here = @engine.here
      puts here.description
    end
  end
end

=begin rdoc
Shell
Purpose:
Dependencies:
=end


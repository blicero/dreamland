#!/usr/bin/env ruby
#
# /data/code/dreamland/common.rb
# created on 17. 03. 2025
# (c) 2025 Benjamin Walkenhorst
# Time-stamp: <2025-03-17 23:06:39 krylon>

require 'rubygems'

require 'logger'
require 'pathname'

module RPG
  AppName = "RPG"
  AppVersion = "0.0.1"
  Debug = true

  BaseDir = Pathname.new(ENV["HOME"]) + "#{AppName.downcase}.d"
  LogPath = BaseDir + "#{AppName.downcase}.log"

end # module RPG

=begin rdoc
Common
Purpose:
Dependencies:
=end


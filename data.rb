#!/usr/bin/env ruby
# coding: utf-8
# /data/code/dreamland/data.rb
# created on 17. 03. 2025
# (c) 2025 Benjamin Walkenhorst
# Time-stamp: <2025-03-18 18:45:52 krylon>

require 'rubygems'

require 'assert'
require 'enum'

class FightOutcome < Enum
  enum_attr :victory, 0x01
  enum_attr :defeat, 0x02
  enum_attr :stalemate, 0x04
end # class FightOutcome < Enum

class Attitude < Enum
  enum_attr :neutral, 0x01
  enum_attr :friendly, 0x02
  enum_attr :hostile, 0x04
  enum_attr :horny, 0x08
  enum_attr :manipulative, 0x10
  enum_attr :champion, 0x20
  enum_attr :nemesis, 0x40
end

class Flag
  attr_reader :key, :name, :descr

  def initialize(key, name, descr)
    @key = key
    @name = name
    @descr = descr
    @flag = false
  end

  def raised?
    @flag
  end

  def raise
    @flag = true
  end
end

class Item
  attr_reader :key, :name, :description, :weight, :properties, :portable, :charges

  def initialize(key, name, description, properties)
    @key = key
    @name = name
    @description = description
    @properties = properties
  end
end

class Creature
  attr_reader :key, :name, :description, :hp_max, :hp, :xp, :inventory, :attack, :evade, :armor, :damage, :initiative, :flags

  def initialize(key, name, description, hp_max, hp, xp, inventory, attack=1..10, evade=1..10, armor=0, damage=1..6, initiative=1..10, *flags)
    @key = key
    @name = name
    @description = description
    @hp_max = hp_max
    @hp = hp
    @xp = xp
    @inventory = inventory
    @attack = attack
    @evade = evade
    @armor = armor
    @damage = damage
    @initiative = initiative
    @flags = {}

    flags.each do |f|
      @flags[f.key] = f
    end
  end # initialize(key, name, description, hp_max, hp, xp, inventory, attack=1..10, evade=1..10, armor=0, damage=1..6, initiative=1..10, *flags)

  def dmg
    base = @damage
    w = weapon
    if not w.nil?
      Range.new base.begin + w[:damage].begin, base.end + w[:damage].end
    else
      base
    end # if not w.nil?
  end # dmg

  def weapon
    w = nil
    @inventory.each do |k, i|
      if i.include? :damage
        if w.nil? or i[:damage].end > w[:damage].end
          w = i
        end
      end
    end
    w
  end # weapon

end # class Creature

# Location is one place in the game world.
class Location
  attr_reader :key, :name, :description, :items, :links, :characters, :flags

  def initialize(key, name, description, items, links, characters, flags)
    @key = key
    @name = name
    @description = description
    @items = items
    @links = links
    @characters = characters
    @flags = flags
  end
end

# World implements the world the game takes place in
class World
  attr_reader :locations, :start_loc, :state

  def initialize(locations, start, state)
    @locations = locations
    @start_loc = start
    @state = state
  end
end

# frozen_string_literal: true

require_relative 'thing'

class ThingsCollection
  def self.from_dir(dir_path)
    things =
      Dir["#{dir_path}/*.txt"].map do |path|
        lines = File.readlines(path, chomp: true)
        Thing.new(lines[0], lines[1], lines[2])
      end
    new(things)
  end

  def initialize(things = [])
    @things = things
    @types = types_of_things
  end

  def suitable_clothing(temperature)
    @types.map do |type, things|
      suitable_thing = things.select { |thing| thing.suits_the_weather?(temperature) }.sample
      "#{type}: #{suitable_thing || 'Нечего порекомендовать'}"
    end
  end

  private

  def types_of_things
    @things.each_with_object({}) do |thing, obj|
      obj[thing.type] ||= []
      obj[thing.type] << thing
    end
  end
end

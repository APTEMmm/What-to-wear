# frozen_string_literal: true

require_relative 'thing'

class ALotOfThings
  def self.from_dir(dir_path)
    things = []
    Dir["#{dir_path}/*.txt"].each do |path|
      things << Thing.from_file(path)
    end
    new(things)
  end

  def initialize(things = [])
    @things = things
    @types = types_of_things
  end

  def things_of_the_type
    @things.each do |thing|
      @types[thing.type] << thing
    end
    @types
  end

  def suitable_clothing(user_input)
    @types.each_key do |type|
      @types[type].map! do |thing|
        thing if thing.suits_the_weather?(user_input)
      end
      @types[type].delete(nil)
    end
    @types
  end

  def recommendation
    result = []
    @types.each_key do |type|
      if @types[type].empty?
        result << "#{type}: Нечего порекомендовать"
      else
        thing = @types[type].sample
        result << "#{thing.title} (#{thing.type}) #{thing.temperature}"
      end
    end
    result
  end

  private

  def types_of_things
    thing_types = {}
    @things.each do |thing|
      thing_types[thing.type] = []
    end
    thing_types
  end
end

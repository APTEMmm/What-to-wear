# frozen_string_literal: true

require_relative 'thing'

class ThingsCollection
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

  def suitable_clothing(user_input)
    @types.each_key do |type|
      @types[type].map! do |thing|
        thing if thing.suits_the_weather?(user_input)
      end
      @types[type].delete(nil)
    end
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
    @things.each_with_object({}) do |thing, obj|
      obj[thing.type] ||= []
      obj[thing.type] << thing
    end
  end
end

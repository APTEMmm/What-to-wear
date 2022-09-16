# frozen_string_literal: true

class Thing
  attr_reader :title, :type, :temperature, :temperature_range

  def initialize(title, type, temperature_range)
    @title = title
    @type = type
    @temperature = temperature_range
    @temperature_range = parse_range(temperature_range)
  end

  def suits_the_weather?(user_input)
    @temperature_range.include?(user_input)
  end

  def to_s
    "#{@title} #{@temperature}"
  end

  private

  def parse_range(range)
    Range.new(*range.gsub(/[^0-9 -]/, '').split(' ').map(&:to_i))
  end
end

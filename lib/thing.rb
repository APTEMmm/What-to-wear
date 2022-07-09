class Thing
  attr_reader :title, :type, :temperature, :temperature_range

  def self.from_file(file_name)
    lines = File.readlines(file_name, chomp: true)
    Thing.new(lines[0], lines[1], lines[2])
  end

  def initialize(title, type, temperature_range)
    @title = title
    @type = type
    @temperature = temperature_range
    @temperature_range = parse_range(temperature_range)
  end

  def suits_the_weather?(user_input)
    @temperature_range.include?(user_input)
  end

  private

  def parse_range(range)
    range = range.gsub(/[^0-9 -]/, '').split(' ')
    [*range[0].to_i..range[1].to_i]
  end
end

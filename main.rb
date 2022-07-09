# frozen_string_literal: true

require_relative 'lib/things_collection'

things = ThingsCollection.from_dir("#{File.dirname(__FILE__)}/data")

puts 'Сколько градусов за окном? (можно с минусом)'
user_input = gets.to_i

puts 'Предлагаем сегодня надеть:'
puts
puts things.suitable_clothing(user_input)

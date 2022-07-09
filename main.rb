# frozen_string_literal: true

require_relative 'lib/a_lot_of_things'

things = ALotOfThings.from_dir("#{File.dirname(__FILE__)}/data")
things.things_of_the_type

puts 'Сколько градусов за окном? (можно с минусом)'
user_input = gets.to_i

things.suitable_clothing(user_input)

puts 'Предлагаем сегодня надеть:'
puts
puts things.recommendation

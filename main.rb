require_relative "lib/clothing"
require_relative "lib/clothing_pack"

clothing_pack = ClothingPack.new(File.join(__dir__, "data"))

puts "🌡️ Какая температура за окном? (можно с минусом):"
user_input = gets.chomp

until user_input.match?(/^-?\d*$/)
  puts "Неправильный формат температуры. Попробуй ещё раз:"
  user_input = gets.chomp
end

temp = user_input.to_i

puts "Предлагаем сегодня надеть:"
puts
puts clothing_pack.get_look(temp)

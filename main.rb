require_relative 'lib/apparel'
require_relative 'lib/apparel_collection'

apparels = ApparelCollection.from_dir("#{__dir__}/data/*.txt")

puts "Сколько градусов за окном? (можно с минусом)"

user_input = STDIN.gets.to_i

if user_input.between?(apparels.whole_temp_range.min, apparels.whole_temp_range.max)
  puts "\nДля #{user_input} °С предлагаем сегодня надеть:\n\n"

  apparels.types.map { |type| apparels.group_by_type(type) }.
  map { |apparel_group| apparel_group.select { |apparel| apparel.suitable?(user_input) } }.
  each { |apparels| puts apparels.sample if apparels.size > 0 }

  keep_going = false
else
  puts "\nИзвините, но наши технические возможности позволяют пока что давать рекоммендации только для температурного диапазона:"
  puts "#{apparels.whole_temp_range.min} .. +#{apparels.whole_temp_range.max} °С"
end

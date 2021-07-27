require_relative 'lib/apparel'
require_relative 'lib/apparel_collection'
require_relative 'lib/temperature_getter'
require 'dotenv/load'

OPENWEATHERMAP_API_KEY = ENV['OPENWEATHERMAP_API_KEY'].freeze

apparels = ApparelCollection.from_dir("#{__dir__}/data/*.txt")
user_temp = TemperatureGetter.call(api_key: OPENWEATHERMAP_API_KEY).round

puts "Сейчас у Вас (Your temperature now is) #{user_temp}°С"

if user_temp.between?(apparels.whole_temp_range.min, apparels.whole_temp_range.max)
  puts "\nДля #{user_temp}°С предлагаем сегодня надеть (For #{user_temp}°С we suggest you should wear):\n\n"

  apparels.choose_suitable(user_temp).each { |type, apparels| puts apparels.sample }
else
  puts "\nИзвините, но наши технические возможности позволяют пока что давать рекомендации только для температурного диапазона (Sorry, but our technical capabilities allow us to give recommendations only for this temperature range):"
  puts "#{apparels.whole_temp_range[0]} .. +#{apparels.whole_temp_range[1]} °С"
end
